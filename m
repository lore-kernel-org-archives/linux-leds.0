Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412976;
	b=JRs/kSRFf29X43a7tgDLUlhbLkH5NKZlKUzUuOtrnNhMBrUgc2BZPvabL3yWHfXZqppZ
	 g0eGFfUOEsiPj2XGUr6vQQSdrDE0c3hSFaGm71eVLM9fNxHIoxVIqjr5cWDY5V64MGlCy
	 HZL5G+z46oKuNNcc1qCaCrWfzIDRHQSNPrsuXkUzOOeUYf8+tJrrRS/6bD2TdeZBVvsBR
	 5DcouxMRaROjlk3zWI2fRbSEG7bCKTSn/JpzvRSgg1dLB0TTst4UDr3N4qHQ4NggYivhF
	 /tZYWZA7AEGkH3BcLM9ke3FRiueCcxzktT8QpL1NA50tEp42ERxF7If/eP+PBUWA0ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
	b=GItXm1B+kF8inyoc4uwvxWakePbQJsDEEuv9E2MEhDawpb0aIBXc1TOO8xWFcvE59RNT
	 E2Xte0x0DYJfW2+zxTQWq3dfktEtEGy8t3ap/jmKEoN1Uha4/2ogu97SLggL5uJ0zK60h
	 JkkNDWRI2q06N/UfO0ZpZjudJ/aGOxQjlAvjO3vtkRVSL1YOjcQzZdkiyThCD5CpXTFWu
	 BMBNFP6WVISJmYUVACH0h9CQULR/szPUHSlQzWtgl5NPeOCYknUvgkUdLU/LExLPmTZo6
	 R2rVzKjevs3rO3V9sLXq9b4WNR1n1cHKeMU00GD2s90rckqxzFuGiGBJrsei9gHow7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKJ9UTQl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B5606A330
	for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2026 16:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0B5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKJ9UTQl
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67bf3c6654fso3851102d50.1
        for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2026 08:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794412975; cv=none;
        d=google.com; s=arc-20260327;
        b=EEgo28N1vaKr8JYjkRpEH2x+EI+mW2R6dEOe6+aT+N8HtYwAoXSdkObNok6S5vNmf5
         DkLtk23r3VZsSH4SjrzG8hHZFA6+cXCGYNEiSD56MdTNmzziYyADlCDPoNQ0MzJCAT+E
         51mEz/2wNPRjFTcElOV5NgNApP64Nb3fvMwlcruIeutYwLa9lZ7mz6kxWgijlnNppp9+
         eYyfbIRW5emQV2OtpyQMipPgQPYGQu5jFwUi2TgbOZx61PQEPXN62J+JN/HS5zdCVR5E
         h4j4WPdcDHoBqAwk6CX53g9/vXAHNGrTTKlmUKokjNEdyWIjx0+AfFPuXev9/Jvc91Jp
         FSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        fh=Ifgu7EDQLjBnU+ZGdiS4oYqkqBsD/oljh1lAQEbsfj0=;
        b=IsXn9bCoPi+Xk8nUFxzjQweyLdPQJlx51aTKkaAj4YBEKf4bgNKC0AIa8JrI9btprd
         STf3/kJCep6WEnWdHRrnKfzk5rk1rmIsmRuxzpmHxJU29ZAGnq8LI6YvopwA6EyabUZC
         oBLycW5CdCbkcT5t3uTtZO5t8DJKdLtzoXTk4FPfhRFgFd+pVKnJ22EUcQN5YJcx1a7F
         O6mbrvucahIR26s4D0OrTfL2rK/TUuTudsRcakNuA84cMJwpMSQy+1WtlRGDqQpx5sB+
         9YsZw7iJ7TIpMhHXn5zr/V2MuL8Fl4M91y5zFZ0VC1hZA96kH/sgKgAB0z/E7xisfDJd
         lPaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794412975; x=1795017775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        b=FKJ9UTQlkrpHd8aeGx0d+LfMWpdS3QS9TXfFNCiStn36JKFVzAHmMK4DgPyjQLCbxe
         4Yy85tuKfsUxjhpsot4j2CyPm3bwTG7QcrgIW9oNa+8BJQfCzFg5VnxmLS7y6oJvgBfn
         VaQKBuTMK21izUqJTD5060QhtlStG7L2P83NhZ6t3CLaktB0l0oYDHStXijKSIMgJ940
         5DTHy5VKDa181kLWtuC7tm//wjmNVhoLdo8diOMuOIxd4PSR83PPwqHIsOHuNfJ/VD9K
         IQDRdXrELU4dQZOw81p+yE3KAeHqlrCgocrjVYrPYM/pxE9xgbYVSFnE9YchtIdy4j17
         lnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412975; x=1795017775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        b=dxoWwP7uLQQz7nPcfexmmiH/gZIoLgoTRaVp+9fxKZW6Q9sJg2QqdQAdaaptmErJfH
         GxreCmDrZPykdRRtCXKxCZG6r9/pIImXtsylgj6g/4YlrK62Cbi3onn68WGppWEeO0u7
         62YJ9onn33NMTv2HvfoqPkB7IN2STTux1Qf1Nbd52XuEclqEM/zXuGfO14i2j2T6gydo
         BIO0Zv5p3U7IHu5xdqZ9ZLvIAVeyKZeNEaOuN3Yf9yu6nCvEze9RaFgZiKcnzuJ9lgeW
         RfIdKObRqYuJQ7cix44UIXeUFTO9M/jqRG8ich5lABt6Z52VDGblKhQbZf5I5SqQdPGe
         64Mw==
X-Forwarded-Encrypted: i=1; AL+hErFuti5kflKq/hXleTnYXPWUOB/fDgAYeHJ2xjfQVYnwPjtOZAIp9+AiMP5Wns8su2pD4upZyGSFw5U4@vger.kernel.org
X-Gm-Message-State: APuU4Z/+sgE5AMXyJ/Hs2Xwutkwi1oJBmUpN+9NwPvku90ZBbf5JLFBj
	mSPUg4S0o7rJqjo0FfbR+HrNDuHHxzQj4pdsKe010xUiYPYY7COYOYcalKgi2l/6O5jhLsdt9bL
	hR2q6vPgqM6d2isFdsOXy6IUY+dngvGE=
X-Gm-Gg: AYBFou1XcUCb9IrPS609ohesXioYK4oYEUPyYOqpL/fLTHf9KFBaRzUI5HvalxrMQds
	H54Ov4ti96P3HGqvuFTr2MbbQgQlKrwoKnbxxx3E3V/iia9bH+6nHWX7SuxgkiWnC66fOjc4CHO
	ZjD2T8/FvTZNE6+/htGzxRKBYoiaQPkvBBOeA2Je+mnNQy1dsaNWV26XZbQ/rsnsHjpyg0vmWPq
	apssuw6jGo0mRtQQiv8UwtwM62l4z4abKnYxb8SQXWeXCn5QB/DOg68Tuifylk4yrulUDT6SzLe
	MqRzuhLAPqXm9hpnlXWRfTv8+3F4x3sIEP6ROHNBarJlDNqRnoWWdpSaL4JS8wWAHPaeyEAXgim
	jIHEJlZY/XySAmcXTCDan0Tovbbg/ZOWqZDPP4KVUpShxKpxMa7v4P9kCyuJdxS7qfAcFWA==
X-Received: by 2002:a05:690e:169b:b0:67c:33d9:7927 with SMTP id
 956f58d0204a3-67c67cb7cd5mr1503453d50.12.1794412974424; Wed, 11 Nov 2026
 08:02:54 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-lm3630a-led-max-microamp-v1-0-ec9e441d9b2c@gmail.com>
 <20261107-lm3630a-led-max-microamp-v1-1-ec9e441d9b2c@gmail.com> <20261111-cute-impetuous-otter-0d70c2@quoll>
In-Reply-To: <20261111-cute-impetuous-otter-0d70c2@quoll>
From: Michiel van Beers <michielvanbeers@gmail.com>
Date: Wed, 11 Nov 2026 17:02:42 +0100
X-Gm-Features: AclHuK-qKY6zTrJn_1i0uQfpLRmaZpJ8hHHbOyKs16JHL3o_cT2giJuDjxuxfRc
Message-ID: <CALcvxfH8N554Pn3uN+cms5zuq+LPGj4rnV39-5G3G9yzhXTfgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: lm3630a: Add led-max-microamp
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On Sat, Nov 07, 2026 at 01:13:54PM +0100, Michiel van Beers wrote:
> > [...]
> > @@ -77,6 +77,14 @@ patternProperties:
> >          minimum: 0
> >          maximum: 255
> >
>
> I do not see in this node reference to LEDs common.yaml. You need it for
> any common properties.

Thanks, I'll add the reference to leds/common.yaml in v2.

Warm regards,
Michiel
