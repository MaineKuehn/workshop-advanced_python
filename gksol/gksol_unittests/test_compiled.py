from . import test_mixins
from gksol import compiled as gol_module


class TestCythonGOL(test_mixins.Mixin.GolMixin):
    gol_cls = gol_module.GOL
