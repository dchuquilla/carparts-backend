module UniqueKeyGenerator
  def get_uniq_key(source_string)
    Digest::SHA256.hexdigest(source_string)
  end
end
