from cpython.mem cimport PyMem_Malloc as malloc, PyMem_Free as free
# from libc.stdlib cimport malloc, free


cdef class CythonGol(object):
    """
    Game of Life implemented via Cython

    :param board: the initial state of the board
    :type board: :py:class:`gksol.boards.PaddedBoard` or List[List[int]]

    .. describe:: gol[n]

        Return the ``n``'th row of the board as a list-like view.
    """
    cdef int ** _board
    cdef public int height
    cdef public int width

    def __init__(self, object board):
        self.height = len(board)
        self.width = len(board[0]) if board else 0
        self._board = <int**>malloc(self.height * sizeof(int*))
        for line_idx in range(self.height):
            self._board[line_idx] = <int*>malloc(self.width * sizeof(int))
            for row_idx in range(self.width):
                self._board[line_idx][row_idx] = 1 if board[line_idx][row_idx] else 0

    cpdef advance(self):
        """Advance the board to the next generation"""
        # most of the board will be empty, so initialize to that
        cdef int ** next_board = <int**>malloc(self.height * sizeof(int*))
        for line_idx in range(self.height):
            next_board[line_idx] = <int*>malloc(self.width * sizeof(int))
            for row_idx in range(self.width):
                next_board[line_idx][row_idx] = 0
        # sieve through the board to find cells alive in the next step
        for w in range(self.width):
            for h in range(self.height):
                neighbours = self._count_neighbours(h, w)
                if neighbours == 3:
                    next_board[h][w] = 1
                elif neighbours == 2:
                    next_board[h][w] = self._board[h][w]
        for line_idx in range(self.height):
            free(self._board[line_idx])
        free(self._board)
        self._board = next_board

    cdef _count_neighbours(self, const int h, const int w):
        cdef int n_neighbours = 0
        # left and right
        if h != 0:
            n_neighbours += self._board[h - 1][w]
        if h != self.height - 1:
            n_neighbours += self._board[h + 1][w]
        # top and bottom
        if w != 0:
            n_neighbours += self._board[h][w - 1]
            if h != 0:
                n_neighbours += self._board[h - 1][w - 1]
            if h != self.height - 1:
                n_neighbours += self._board[h + 1][w - 1]
        if w != self.width - 1:
            n_neighbours += self._board[h][w + 1]
            if h != 0:
                n_neighbours += self._board[h - 1][w + 1]
            if h != self.height - 1:
                n_neighbours += self._board[h + 1][w + 1]
        return n_neighbours

    def __getitem__(self, index):
        return [self._board[index][row_index] for row_index in range(self.width)]

    def __dealloc__(self):
        for line_idx in range(self.height):
            free(self._board[line_idx])
        free(self._board)

GOL = CythonGol
