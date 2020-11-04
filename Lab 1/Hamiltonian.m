function H = Hamiltonian(n)
    h11 = randn(n);
    h12 = randn(n);
    h12 = h12 - triu(h12, 1); %makes upper triangular part (excluding main diagonal) zero
    h12 = h12 + tril(h12, -1).'; %makes upper triangular part equal to transpose of lower triangular part, excluding main diagonal
    h21 = randn(n);
    h21 = h21 - triu(h21, 1); %makes upper triangular part (excluding main diagonal) zero
    h21 = h21 + tril(h21, -1).'; %makes upper triangular part equal to transpose of lower triangular part, excluding main diagonal
    H = [h11 h12; h21 -h11.'];
end