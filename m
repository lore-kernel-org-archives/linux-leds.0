Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7593815E1;
	Tue, 13 Oct 2026 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886294; cv=none; b=hlpoisZWKh+rdjukT6XzXrAVU2XFWkR+g80QEkm2w6qk2Sg8qpuxsxfPa5N3H5tH8QlFzEBK+/BktsOZfh7XidpjHZFCToACea3/RqaVTvxNpgn/ubvycj9npLKCmUoT6XrYbHauEFCM9SAtikL8oeYAeR1WMvEGgUuHDOEnWas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886294; c=relaxed/simple;
	bh=PHze5tivd6v131HmvSd2AcJ7T6uJuAs5GpV6IGX7TWM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QsSjHM3+EfNlM+S7Utu4sOTnNCPaDRnW3LhKrtC2ggcn/YVVXQT9tIQnVdbErXEd2SseBbqDgk69wSJVp3y12+mvx2E9hUaIkNoHwwM9pjLjRvc0Q7RxtsHTP0GOKfw8ZgTPFQDAU8ZmZBX0nGJrAB15Z9Cd3mPO0rTuaKHYQa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=0hw4U37x; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="0hw4U37x"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j3qqh1kPRzMlSC;
	Tue, 13 Oct 2026 12:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791886288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PHze5tivd6v131HmvSd2AcJ7T6uJuAs5GpV6IGX7TWM=;
	b=0hw4U37xxOxPlzRjzylD+lv95/4n13uG72UMabKVksSYjYKpJE81D7zlpGz6s69CGNIQo2
	3Kl1Kw1iQ6PpN1gOaYDKQnWEa0hKXXxgexKg5/jTOR+4+Kkrz1TVlyXJv4i9hGUfJjI6pr
	pMVir6FnkdbkT5VXI1Up8b38as6AjQYAmYB/sdGi4my2ve0y70gLJ3Jw99/mWWQrTgIL/I
	PBGbzupe1ApBItGaJmJDybKU+/Tr6iQkadmQl4EnRK/OauURXQ6Tbn8pLL8i0T0kqTiQdg
	IzwjOc5jczmRsNVunNzxbTe7BDT71guWqAqyGUEXJdrbEReMiiU7oGxRKZtF+w==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: =?utf-8?Q?Fl=C3=A1vio?= Amieiro <flavio@amieiro.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
In-Reply-To: <7f43a5c0-e781-45db-bc8b-db6684c9aac0@kernel.org>
References: <20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net>
 <20261013-add-is31fl3206-support-v1-2-08c066cc241d@amieiro.net>
 <20261013-jolly-salamander-of-tact-7cf46e@quoll> <87zewhudle.fsf@berlin>
 <7f43a5c0-e781-45db-bc8b-db6684c9aac0@kernel.org>
Date: Tue, 13 Oct 2026 07:11:18 -0300
Message-ID: <87fqy9vrjt.fsf@berlin>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4j3qqh1kPRzMlSC

Krzysztof Kozlowski <krzk@kernel.org> writes:
> v1 was sent today, so how could review be after v2?

I sent it last night (in my timezone) and saw Shashiko reviews that
needed addressing in the morning. That's why I sent v2.

>
> One version per 24h, so you actually allow people to look at this code.
>

I didn't know about this rule, but of course it makes a lot of
sense. I'm sorry about the noise in the list, and I will for sure keep
this in mind for the future.

Best regards,
Flavio Amieiro
