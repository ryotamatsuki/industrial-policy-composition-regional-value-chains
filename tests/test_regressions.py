from model.baseline import Params, decentralized_threshold, is_nash, planner_corner_optima, q

def test_r1_intermediate_wedge():
    p = Params(delta=1.0, alpha=0.5, A=1.5)
    assert is_nash(1.0,1.0,p)
    assert not is_nash(1.0,0.0,p)
    assert planner_corner_optima(p) == ((1.0,0.0),(0.0,1.0))

def test_r2_nash_threshold_boundary():
    p = Params(delta=1.0, alpha=0.5, A=2.0)
    assert decentralized_threshold(p) == 2.0
    for x in (0.0,0.25,0.5,0.75,1.0):
        assert is_nash(1.0,x,p)
        assert is_nash(x,1.0,p)
    assert not is_nash(0.5,0.5,p)

def test_r3_high_integration_multiplicity():
    p = Params(delta=1.0, alpha=0.5, A=3.0)
    qs = q(p)
    assert abs(qs-5.0/6.0) < 1e-12
    assert is_nash(1.0,0.0,p)
    assert is_nash(0.0,1.0,p)
    assert is_nash(qs,qs,p)
    assert not is_nash(1.0,1.0,p)

def test_r4_incidence_wedge_vanishes():
    for alpha in (1e-2,1e-4,1e-6):
        p = Params(delta=1.0, alpha=alpha, A=1.5)
        assert abs(decentralized_threshold(p)-1.0) < 2*alpha
