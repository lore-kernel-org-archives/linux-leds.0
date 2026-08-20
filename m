Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54BC47F2E3
	for <linux-leds@vger.kernel.org>; Thu, 20 Aug 2026 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246144; cv=pass; b=QkPwY1Q8Mo44vaxnrOJVCkDei7xENqgDahzVf6nKJS3QfShbHihULwtGLixq+TXcevW3pE8t1oQsQOp9fvF+xWf3bV0kYIDNkWlx/F8boxFryoLZzm7V6/tO+tD5Eci5OAYBJ75OyPwL4uHYudR2cTqd/OOqV+PG7DO6RAATq0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246144; c=relaxed/simple;
	bh=3c721Up4XKT9nSGpOXXtxDHVpHlRP7Uy92JTc+lNdns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNBnn2VWUpphj6gVp3imvmUZcWYVvaweuTaMx3Ja5fmZWGqklEaIfLtS2cOCF6qWQTySkGf++eDm/GKgwDiJU9VhlJ9OotWpNzzIGFqxv2SgglHI1xZYQUFRWHbHmgfDHeBMMRuN59ri2NQl5p8rW5G/oSmT0NynhUPLGHDpnlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhlFp3TR; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhlFp3TR"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b015b2d792so63631e87.3
        for <linux-leds@vger.kernel.org>; Thu, 20 Aug 2026 10:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787246139; cv=none;
        d=google.com; s=arc-20260327;
        b=rwMnGOvWtXkH4m7g/FxxpGLWz6kdqAtUg5dAGj726x0zIXpvXLvhvR3SwIyoYAGk0b
         Phw+07Mh4Ao3RFsZAqmPLRCPFxxufnX5O/Q8m0BvggN3mOGiL9gJ9/DsddIDF9sFgsru
         0zJJjkOI0IcFta595sgOFlGzs9StTM2OA8By7S+Jy95lare4tFl1uWXQe8XoSz/M9ig2
         vL0+eq4g9LWxXh4lnddsd9jzw5Ok4bxv6OOOb7geijLqwEhDYKYP4GhYkYqGN478ct6v
         g3vuC4oq0fNohMacLbaxNR0TwNxUnwBAdNw0Swl45tNS74h1SNXROQbJgF3qLRaSuoZJ
         rYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3c721Up4XKT9nSGpOXXtxDHVpHlRP7Uy92JTc+lNdns=;
        fh=M13LVMKak/ay/lrSE1sB7HtNSEtEYOhkShdv0TXVYTQ=;
        b=mF2DYpS4n/89qC+ygSjgtgrlX+F2J/X1Lz5oJ++cMKvRza4b1xmMANV7YpRJAvYuly
         oZuBkzUqR5RyuGpeGYMl6eATmct/TfkOOEt6WfXMrnGapY3zAGkde8qB+k5m3IzRgRjk
         /M6e6RH500Ytn8MdmJ6kxB2+MQ8uyYbn/qlRyNlevh5cyff5biJXCQa1CQALiPbtiwte
         oG5qc4UUawqPvpDpWili+UG5x8e3RpR68PBBHZiM5d7f6xGdeoKc9YtdU+qCJo33528G
         5FHWKlv23CJqMki310ZPy3aFP90NVI9CFhUw0GW6Pwk5ZfGvN41hbul2VKUR6D1r+Txj
         JdQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246139; x=1787850939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3c721Up4XKT9nSGpOXXtxDHVpHlRP7Uy92JTc+lNdns=;
        b=QhlFp3TRefwrLZ5PfMTwM44EhPA7eyKSTgpKlbnn8CsBNAd+6s3hZS463nASuDpHC+
         AJxWvHeeK6gWkaANJOs1Li8zVYb/fJ8LAPNBJW6zoGBncjp3YZXPBeXJl02D4JiR/9hO
         ycHMAUkbsmDiOuee7uP63wrTV/iaI3TE1pEV6msMexdgEaU4uA9feVoFm8Z1cHGdsp1y
         wZNhRoJLmizaB/068ODHC4Udt1Ai20xGeK0V3yREl9YlobBc5n9g5JWd29Zgycu8I7sl
         6CBZuH9NWPt0QyEeG7aaAkiBQHc5bLdWkGYoE5bpXonU9GlrhZaAT8kRnfM5/ZCCmH2r
         xCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246139; x=1787850939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3c721Up4XKT9nSGpOXXtxDHVpHlRP7Uy92JTc+lNdns=;
        b=ACizYMEDGdcJQd7DdOsYKNKSU5NH7sw6KJsy3a04og9BtANta76YsRbdtnnX6fp9zQ
         glw0u6QTXLu9n0Qird5C1zhFVjMI8ff4O2oTOFDFRmSsIsk5mQGDiPBTSBxg+Bps1KQZ
         aed0d2u2E/HTJt+ntPz57pMXFjCQdtVG1wBgKwqh6A6YwS/isIxsgLDf7c5lWghBdNsQ
         pR7BY81q6sftevWtT5ZJ2IIH2aNTsAs3WpA62P1QJ1nWBXL6ZG0swVD71cqrd7M8WWfH
         oOBfsJ75hIScft4sap4kYrB9hlQlnOXOD4KdK0eZvHwxjTh/n8UXadWoON3qj+yn36eE
         sCfA==
X-Forwarded-Encrypted: i=1; AHgh+RoZAC0RDrheXu3IfPNsA6UWwwBfX4br5h4LN7qeeVztz2LLbFxQKCVEs17dif5+Gp6HmNZEI8H/1Z+7@vger.kernel.org
X-Gm-Message-State: AFuF++lUxkrYGaUHhSx8MVIyi4A5yCyJSRIbHyn+sg0QuGL1dKFf0Wck
	RtJ7IfHj1kjvkIdfswa1eOunIxs6YNx3n/AU8WIH61hctbxxpYDQdf/TqyMrL2Vn04SQA4oAwqT
	H95+Nk4cQR7AoGSdRlUkSv5TU2py+Vns=
X-Gm-Gg: AR+sD11b7b0x3Urd2ffkcEkpmSOWxphSO2eIlz+w+CF9hPy87mksnB4hWl/GU62nbkw
	I4Dk2syyGdnLMm1u3u0yY0oJhi+zmOqcXdgzLXLoIcCbkfcyJAFSj8p3xOSyLYbf91WAaj+2wjO
	RnGHp4YxOAP3FwDt28UKPEzhL2PSD6RTbQMIbhuUFEjdl1u/ZcL7EMShxO/D3liZ7CKMGXLXyUT
	W6pYGlRfV0b4Ku6HmJGzjAmWuiAZuCN8d6+O4o3bkYWgemQYfHY4YAXlWHyMDqCVGPFnGZx3+Z0
	gFaERFJq8v1mYF8tG19fWNrbA8o78A4byPzbHIO+Hu/ZfOrpMPsa28xPE0dvlcWMUFMF2Nk/MQv
	mQUhnknQcfG64sX+qzmesDOFkGA==
X-Received: by 2002:a05:6512:3c92:b0:5b0:bc3:dc11 with SMTP id
 2adb3069b0e04-5b478d1f07fmr4752522e87.22.1787246139023; Thu, 20 Aug 2026
 10:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786746757.git.ahmadexp@gmail.com> <20260818095654.5357db1d@kernel.org>
 <CAOQiBWM57ZBafMcj9MaegHBuM21313O5PqAAGXdHfvmHxHp48g@mail.gmail.com> <20260820100302.1609c979@kernel.org>
In-Reply-To: <20260820100302.1609c979@kernel.org>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Thu, 20 Aug 2026 10:15:26 -0700
X-Gm-Features: AcwNN1VG-G40EWmCjL4DcV3v9ciEADsSL9chtIKAvcClckRaycXWK-AFTAquNos
Message-ID: <CAOQiBWPZg4xkZFsUm9g6XBYz+vixaKPaofdv1rvxGwufD3jm9Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/7] ptp: ocp: Add R4006 and V9 I2C peripheral support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Nam Tran <trannamatk@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood. I will split the series and send the IS32FL3207 binding
and driver through the LED tree, and the I2C mux changes through the
I2C tree. Once those prerequisites land, I will rebase and resend only
the ptp_ocp board-profile changes to net-next.

Thanks for the clarification.



On Thu, Aug 20, 2026 at 10:03=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Tue, 18 Aug 2026 11:12:35 -0700 Ahmad Byagowi wrote:
> > I should have stated this existing hardware and end-user use case
> > explicitly in the cover letter. I will add it to the next revision.
>
> You need to send the leds and i2c patches to relevant trees first.
> We won't take them via net-next.



--
73
With best wishes / Mit herzlichsten Gr=C3=BC=C3=9Fen
Ahmad Byagowi, Ph.D., Dr. Techn., P.Eng.
Phone: +1 (650) 924 6653

 Please consider the environment before printing this e-mail.
