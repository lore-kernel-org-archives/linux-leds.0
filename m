Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7425286A0
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407119; cv=none; b=VLKY62wzdj0HmWTJEwtZ3PrzXbkT0P+yJ+ZA4V+wE0SJJRDrcaYNuNyzCeZVdn8TL4AEhHwBZgarw2/tDqi5GQ2iOc8iKYfIVvAEcBoVr/rs+cRPRNd+ri4Tqad48ayhLmRPxAHvRi93MunUGzM65wkCJr2cRw+oPs1HR8rFYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407119; c=relaxed/simple;
	bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=La0mveeu+UsgFIilvxw+Pw9rkCNyYctFII/cIEtY2rFIbA0rdfBVQkMu7r83GXCRcPL13Rp+XbkllKFNmmJm9sALhZJoFSvuzR+hUCp9f3zUexaSPpzlFdc06lCsW2919TYETbMcquxfCzAGK2tnRPy0eKHhIXyLwiNyiql+ouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=mihnb2lN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="mihnb2lN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so6720885e9.3
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792407116; x=1793011916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
        b=mihnb2lNs0zq84B4egRQGOF7XNQjSy4XS7+axCL8ohb4ZufbZE/XPSK//tOwjI0Iss
         tZB1MjbHTh1WjwPqo4/Wbh9I9Z3519yPIbieIXnUzmVKGuVX30bnJ+qy69c2jwktGbsY
         +aF4+AYoiNofdREcuASsGN1UHlJulqZ0QJlsDnSs6Z3ta3rs/gazBKg7lI7oB7J0r+j2
         JdDuzLZUglB4nLIMvm3boevXEFKYLfzQtd1krffrx4Pk6/or4vl4Bk1SJjzYYRyKJ4c1
         HEQ03NgADEXDldMr8Qx4yyOeDalMHo6RKUW2VIn31ioByHF+tUZ8eFYPsRGxazYzjBcS
         XWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407116; x=1793011916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
        b=XbKBSXTsDVleZbjDXM7eyuVsi29hPt84RSudnJeSyWyrQOg07l9FyfBLkFQoHzTRfh
         ueo15QXsI1QWgNfiD6cIz53p92kzaApXq8f6o6ontfyGar1+3CbjuqdfHKcuZPpIb3r1
         L46ONoc+tO/KC9d3T4Wkk0mXjRmlR1DvWKAmEhHZoYRGvcL4SYOgguWE3mOiYVJc8Uu+
         3MJvE7w436QPM2lYk0KBuExY+RGiheIRhTcc3Xh3A9+CNvO+Bezh9bKTjXasNGsiOzWI
         eh4yqxT5J+D3pnPU/1GAz1fLxYP0X05qY71h5zzgD4n/utzxiOiGRBckLtDutO4rJBvO
         OmTA==
X-Forwarded-Encrypted: i=1; AKwUvBx1hOKESvF7VBl4Zni4084T2AtQzpS3rhIkB9ugnfGIKAjBC1aAxD/AbMgix0Ev+AR3TOYZQzxdHx77@vger.kernel.org
X-Gm-Message-State: AFq9FYInrGLh8p/4a4IR6fL5QS2/QWf7GznABBFppTQRyLdvF7zTtyYw
	TOU9V6t7CzCC+LVHj3oXEj7juuS00Tgp/jAEbNNDNVr2xVBRFw88MtES2kYLlZvgC5A=
X-Gm-Gg: AYBFou06vf8wt5Bw1ON276VdzdA+t8IAQdiAQewLieeKB6dzsX6rGUBx8PHcvoIj5pe
	UvXLz4HDiLCtlnGphTlKFPFjvpufPIcTP/5PrhySdvMIAhSgOUSgAaaZOLhElEeyIvLY7xLXtPp
	2DgDIe3tlBpM8nPmkUcXuitX2lgzxW6qH4RIPuB0PYGf6RF1jh9oTFjJDI1CRHgRuh2vnM1SSat
	yJ/0fZXWJGPxgJIE4LJIP0Bkt5+sOU2ggJdiuLePCG68V2uQ48K8sZxCWNp37cpXpoEQ2aUZSL4
	FJt4ZmwdCl5NK6104c5zOePTEiTw8t7p1im7vT6ipF8at0UQi3MRtRXQwy4RqdzdusBICBlhziy
	NxGPR+S262DkRAtwybAlQHvk077gmEFnbR4ftf5SRO4vGLe3yxo3xjPZpIusJxoXGpjotXWwShQ
	/mf4fppSp/qEhvsZpCwMutTh1DX7bROlVLXHBHzfTwxqQP+KyPCWXQXoJKCYal8jLzwrogQWo5s
	smqrlcQPPhqHuz2teEmJLNkNi1acGO/0TU8RuhiZUFXJfuHRl0BjgdFVI7cB7Zb5fuv5nzLUonB
	+s/M9i7tbttd3M8vflWwHUSCk8YX+a0HqnN2Xrob2BunHaFN9ZKuQHyKZI5cEl6UilBlbA==
X-Received: by 2002:a05:600c:1da1:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1d76011ffmr159510145e9.19.1792407115972;
        Mon, 19 Oct 2026 03:51:55 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm349369535e9.8.2026.10.19.03.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:51:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:51:53 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Luka Panio <lukapanio@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, deller@gmx.de, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: Add Awinic AW99703 backlight driver
Message-ID: <atX2Sf4GJNFYq2ZY@aspen.lan>
References: <20261016162912.64581-1-lukapanio@gmail.com>
 <20261016162912.64581-3-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016162912.64581-3-lukapanio@gmail.com>

On Fri, Oct 16, 2026 at 06:29:12PM +0200, Luka Panio wrote:
> Add a driver for the Awinic AW99703 3-string WLED backlight controller.
>
> Register values follow the AW99703 datasheet (V1.6), the structure
> follows the aw99706 driver.

Given how much the structure follows the aw99706 driver I'd expect there
to be more code sharing between the drivers.

Cold AW99703 support be implemented by extending the existing aw99706
driver?


Daniel.
