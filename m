Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136604;
	b=HESnWW16z685pXp/uSfcs9PoT9dFpv5D6fLaDu+1CBD6SJxWkv9rzXG7LDUQsZSIakce
	 JeA+gZkGO/F/TLcqSK2U4jXKHGG8kuMGfmZviMrQy4K/W+69S647dgyPG4BAYiPJAA/Ni
	 25HWUV9CwIXUTyAKv44Hk+DG0ajD0uGnDsACulFD1oYHx/DxfiVzzLpEje/dBzFGgRj7O
	 0iD5dge6LuWQ/fAvDnVxnixLJ6ZlSqGw+Z5EL63oU3hBhIhBleZ2wzaaEZSFKioo11otC
	 N9o0Iq5l80ckazbgNasS4JevCAu2IrT6zHjhFLGQqd2xFd7BawJWDSsUm+bjM9c78Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136604;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OOuxZzX03Fi4IMOZT+u4uKVj+rtt/tc93nsz9tD3bXw=;
	b=WmzYFmr07o1l4WTvCirQMZOoPnqrmFpwvumpqe8fMtpkwUTbg+22zGIBtwip3fZEcisn
	 0BA7ZDBxWpD7wfAT7Y0hIni6ysRkRRBPJZJu2vumFR9XdG51Z8oA3oEKyIUU9FLB0/gma
	 Q8bmE6fXKf+jNy/vXKVvJ/idpcYe8oa/JSL5yqss2Vv6jwum3JaY8goWMNtJy4i/Jysza
	 PNArnDhg5AJ0Cj80lW252QqijNSV7x2o10BQcVic5xoiCziFGnoHmHXMR/lrZhuBwRPrc
	 FHJvJr8rGfKVTQAh43tBnPi2XjRLOfm+R3o9wR1MmeQ55ogntj+d6KeihzQ/USO6BGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jnki2b8u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D775606A31A;
	Tue, 27 Oct 2026 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jnki2b8u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38A51F01828;
	Tue, 27 Oct 2026 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136604;
	bh=OOuxZzX03Fi4IMOZT+u4uKVj+rtt/tc93nsz9tD3bXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jnki2b8u0n3/QXVN9wXdUVd6XlXvIeWGSJddSkLGBgsprFbZa57fVNMZH97wNm39n
	 tKQSTKXHQiURdGTwUkABbN4Ij1+lNAsT+HR6SxdO/tYUGumbW6iJDc7eIsHwu9GLl8
	 z/JxXbhG0b8nWOGahLcYkoAX8ZRq0IWgrPf7n9Kkr74P1bdIcMAGGKGWvsFyUbUKZB
	 liRZgIFqgzEpxOExFedUZTTzUvS91D8dG9A2wYvPUorXr0WSezbGYV5pKVME3YW8o/
	 /Ht6WHvP5/P92SRF3e58i/4PxSQfbr70MgEZvHmYS7GshP0x+W3UEMiiAzK6a2M24u
	 PFrbmfkLpNIJA==
Date: Tue, 27 Oct 2026 16:30:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Kees Cook <kees+treewide@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
Message-ID: <179313660040.1181023.12801334630310862763.robh@kernel.org>
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-3-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013181803.496627-3-clamor95@gmail.com>


On Tue, 13 Oct 2026 21:18:02 +0300, Svyatoslav Ryhel wrote:
> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
> inhibition.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

