def decompose(n)
  decompose_helper(n * n, n - 1)
end

def decompose_helper(target, start)
  p "#{target}, #{start}"
  return [] if target == 0
  return nil if target < 0

  start.downto(1) do |square|
    next_val = decompose_helper(target - square * square, square - 1)
    return next_val << square if next_val
  end

  return
end

p decompose(12)

# decompose(7) << [2, 3, 6]
  # dh(49, 6)
  #   n_v == dh(13, 5) << 6
  #     n_v == dh(-12, 4) << nil
  #     n_v == dh(-3, 3) << nil
  #     n_v == dh(4, 2) << 3
  #       n_v == dh(0, 1) << 2

# decompose(9) << [1, 4, 8]
  # dh(81, 8)
  #   n_v == dh(17, 7) << 8
  #     n_v == dh(-32, 6) << nil
  #     n_v == dh(-19, 5) << nil
  #     n_v == dh(-8, 4) << nil
  #     n_v == dh(1, 3) << 4
  #       n_v == dh(-8, 2) << nil
  #       n_v == dh(-3, 1) << nil
  #       n_v == dh(0, 0) << 1

# decompose(12)
  # dh(144, 11) << [1, 2, 3, 7, 9]
  #   n_v == dh(23, 10) << 11
  #     n_v == dh(-77, 9) << nil
  #     n_v == dh(-58, 8) << nil
  #     n_v == dh(-41, 7) << nil
  #     n_v == dh(-26, 6) << nil
  #     n_v == dh(-13, 5) << nil
  #     n_v == dh(-2, 4) << nil
  #     n_v == dh(7, 3) << 4
  #       n_v == dh(-2, 2) << nil
  #       n_v == dh(3, 1) << 2
  #         n_v == dh(2, 0) << 1
  #       n_v == dh(6, 0) << 1
  #     n_v == dh(14, 2) << 3
  #       n_v == dh(10, 1) << 2
  #         n_v == dh(9, 0) << 1
  #       n_v == dh(13, 0) << 1
  #     n_v == dh(19, 1) << 2
  #       n_v == dh(18, 0) << 1
  #     n_v == dh(22, 0) << 1
  #   n_v == dh(44, 9) << 10
  #     n_v == dh(-37, 8) << nil
  #     n_v == dh(-20, 7) << nil
  #     n_v == dh(-5, 6) << nil
  #     n_v == dh(8, 5) << 6
  #       n_v == dh(-17, 4) << nil
  #       n_v == dh(-8, 3) << nil
  #       n_v == dh(-1, 2) << nil
  #       n_v == dh(4, 1) << 2
  #         n_v == dh(3, 0) << nil
  #   n_v == dh(63, 8) << 9
  #     n_v == dh(-1, 7) << nil
  #     n_v == dh(14, 6) << 7
  #       n_v == dh(-22, 5) << nil
  #       n_v == dh(-11, 4) << nil
  #       n_v == dh(-2, 3) << nil
  #       n_v == dh(5, 2) << 3
  #         n_v == dh(1, 1) << 2
  #           n_v == dh(0, 0) << 1