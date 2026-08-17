Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6333ED5BE
	for <linux-leds@vger.kernel.org>; Mon, 17 Aug 2026 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959636; cv=none; b=Ee557laAM1nobdPGi4f9JUZElC75BKQRqWfA1Se6qNiWG44SktwcRqYz3MRu7Vdf7T6P5UL19mn4S68F1oJmrhNy2JUwne6yvrIJJKCyE63vYRG7tcjb/5PI7uWRYlum8nCro9po74yfopj/tR+enaLULSvFppSbc4Dw9AEhRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959636; c=relaxed/simple;
	bh=7VGMnmkejSh3sVd1hpCqrgINcXXfow/Hx/voysWE7aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6BVda+Ku3KTLrYhnj1SKlXXMOwvV0KrPjr+9S7WcryrJZiwp0bR94l8ZcCtZEmfHTVrpLWMBebL8y0ZReRBdEltFrTd21YX8BdvuKVNYnkSTYoBd+KpJr3D012MbF0VcSHQxkZfqqQZzDRD8keB/bLvTY6IajAYfD4SQr+u/q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=OxK4Afoo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="OxK4Afoo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495590dde14so39553445e9.0
        for <linux-leds@vger.kernel.org>; Mon, 17 Aug 2026 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786959628; x=1787564428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7VGMnmkejSh3sVd1hpCqrgINcXXfow/Hx/voysWE7aM=;
        b=OxK4Afooh8iWOamFVvhtRaf1jWHdGPK1FjMkEV3a3QqNw0LDcpKZqMu0Zq8zQhTLQ0
         sUPvznOvTY7RAk/NMVcfFcO6I5gO6PSj3K7efy4kNAUa4ttskweRQ8W2j0ywHsz6edML
         PZYKscBMMxK7Jfg0i+jzxH7xyXhqAOyvHgyp0cihRIoAtABDOqD3PG5WbGkTc2qcoSiD
         xKTWuHRyU7hCuKAjS4vVRCXU4AKKX09/4gtp0gpZ6k3UlEAVIgQ5OE8Zh3mHlt+Q4GXL
         dHWln/0RGeATlUNIdK2CiJkndhAiu58SJCDz4lMOnWk3OaxT9x+kfO2zJoySZr16r1gl
         hIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786959628; x=1787564428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VGMnmkejSh3sVd1hpCqrgINcXXfow/Hx/voysWE7aM=;
        b=mqYapNBYQ7q7PuG5yTcfmRzoibcCUMD+x/ew6ikHPVlPrPkMefiQf9qt6WiJSytICo
         ByzLF43x6+2vt7A2jLg4iflprFk+AR8pRB4NWlwPyk2rx3EZC7hjwcoMtMqVerMqJRqQ
         FijklZx0CDcTlcigWwUbh1sIi2wUBkqg3B245b3preMxYy/S/zCol9A0IhP4EAsq44zk
         aH7hcRZU98jG4fvvZZ9WWDsJ813tx7DzCvP9959zqw3NSGbNvn2aD+hu5Evb4S1fWiMi
         ROQGHyCvQP6LQWzZ0sGu+GZI2xcxREclo1/AMaqle/gGpTNJ+udinRaVgk9VcEo3ypLX
         sJIA==
X-Forwarded-Encrypted: i=1; AHgh+Rqf/Su7N3WsAEW6i2w9EDveJBsehhgExPZscV56EHSp3tRNOvVbU1tDWw7VI3BijhvaR34ScEjf7dMt@vger.kernel.org
X-Gm-Message-State: AOJu0YxAwVsvgMGbr8lQBYq7GtC+mVPlsNfQWJn/eCqBCVhBWiarYzlf
	EHw4WfzIiwQThSla+X8mCy4E+VV+71K+kuqTxNJuOTySnCZC3TeToxufdctUXVncJAc=
X-Gm-Gg: AR+sD10V349e14aVnvjwCUjr2LKZaXDnYLb41hFr47IURKQ5HRilnbsatW9JWUmsZGH
	SFfZaRsBsoNToM4hTHX7A5z9LiaaGkn9Ss1O9JJ7uFyfJsYp2IW3QBsAO/e18PRbVRcghuYfWTC
	qvmzm3zkuRxiCGoV4WfejCZfN/mHMY6Z4ulRSEtJyqlV1Gm26cVuEFN5f10BF4ju1X6sCcF+PFF
	W7hdTTaxw7hza3S7NZZgavLVxMFAkTi/9eZ9mAuKW/Kgy1mONRrgAxyEKUQPcl0eZZtNr6907Wk
	IOt8Ee3UDyfRAC8r531DM2PjciKKJ/9RsD1kT4QE+KnzQpfY8IPEsO6IbtQueJuEBQLjSG1ptpE
	+9DpIDNqMghGMt7C76XjAjE12LmUcit0na2gxOHqUGVcBpuMdFFupTcuU6ITfHzma2Cwtlv3L9o
	4HXn1QOalji5lgQjEPNSDPM2wY49AqqSTwC4ySma/s4hA0l3gqm6qqSV07AeAyPG/yU7+lS64Ml
	mJuG+rg+3ejZXF90tsgUQDVSXOtWqS1qz3lgQ1socvfZJIsyIQmZBfNn07kXVxgmWEV7iOMSdi2
	Wa5N/ssZCdKmUXXRE5spNXucmPAeNxo3CBAxZlo+nGOluA==
X-Received: by 2002:a7b:cb1a:0:b0:498:519:e660 with SMTP id 5b1f17b1804b1-49987935847mr230720425e9.4.1786959628339;
        Mon, 17 Aug 2026 02:40:28 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0fb867sm36476785e9.10.2026.08.17.02.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:40:27 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:40:25 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Wim de With <wf@dewith.io>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: Add Orient Chip OCP8178
Message-ID: <aoLXCY-q_o9IPDN3@aspen.lan>
References: <20260816-ocp8178-backlight-v3-0-caf95c453c50@dewith.io>
 <20260816-ocp8178-backlight-v3-1-caf95c453c50@dewith.io>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-ocp8178-backlight-v3-1-caf95c453c50@dewith.io>

On Sun, Aug 16, 2026 at 12:57:03PM +0200, Wim de With wrote:
> Add device tree bindings for the Orient Chip OCP8178 LED backlight
> driver.
>
> Signed-off-by: Wim de With <wf@dewith.io>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
