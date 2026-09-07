def test_r5_endogenous_capture_does_not_guarantee_finite_local_threshold():
    for tau in (0.0,0.1,1.0,10.0,1000.0):
        G = 1.0 + tau
        lam = 1.0/(1.0+tau)**2
        planner_gain = G - 1.0
        local_gain = lam*G - 1.0
        assert planner_gain >= 0.0
        assert local_gain <= 0.0

def test_r6_capacity_matching_blocks_general_complete_specialization_claim():
    Delta = 1.0
    A = 2.0
    def capacity_welfare(x1,x2):
        M = 1.0 - abs(x1+x2-1.0)
        return Delta*(x1+x2) + A*M
    candidate = capacity_welfare(0.5,0.5)
    corners = [capacity_welfare(1.0,0.0), capacity_welfare(0.0,1.0)]
    assert all(abs(candidate-v) < 1e-12 for v in corners)
