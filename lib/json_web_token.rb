class JsonWebToken
  JWT_SECRET = "87f413c6209986d9184873d00fd2584ae00e8900c80b50311b1bd6a0ed9cbc02e8150ab1bb17269ff056f2f10e2233028eee7dc156a86a516042a8617a52228b"


  def self.encode(payload, exp = 12.hours.from_now)
    payload[:exp] = exp.to_i

    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET)[0]

    HashWithIndifferentAccess.new(body)
  end
end
