Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792481250;
	b=H6pcQc0UBoL/rAni0KFr1y9IsXrGtecBShcXFeyW8YrPqG7OzAp0vJFjl7Ubln8CAzy6
	 zWlEm8w00G4tt+Qm719KaFej0PpAzN8RTTX6K+0JywhvW2MBXOXVYG8IGybaVHb+pIyRO
	 1/UsReEylttKYFTdU5lBKjszPQuCkDb77pWjHAHHHm3yP4lagea76Nah1qIK/plf1i+Dx
	 rJiczIPU3Nw/1qCp1ulpuRiOHtEi8NOXrFqNGx+XuQ0l7jauCA1DzVmMtwJow0eZhd6Xw
	 5+A89yryzcl1tTT20ytIdG4kl4S2wtcKh/46d9eRaTurMK0S8xBGZ7Yw4wwQ9E9dqdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
	b=w1NCraJgjXh12JrKVyHldvHfiqCB+eu8JAjMowOthSl+AV5V4a8h0i7Y2JemToOxX79B
	 zLEIMXJHCXEYj5V3QKq39YBrCvwAWzMRzi4L8/etTDSHi2a2Sb+9rlmrGZfpOQyEYtgOy
	 3VfyEXGZpAhrQz6EfMAytGy8EeY2zzPlzFls3bXxvJOtSsfpvpYYckgkx34yRtPmULITO
	 ePYnbEsaMP3TXXob6SwmjAuOvHW2xOsdPiVkd7Z9t+0bhdxvWk/h4tEFQz7Q8RGYF+6F4
	 rZOui6EUrnAiLFoV54IHx5NZwdIDqpqErnSZBBjGecupMqnLlRjlHM2QTEWYsIoOV3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BSkiROCn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E6D606A31E
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 07:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E6D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BSkiROCn
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-354ba08cfd1so5313507eec.1
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 00:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792481249; cv=none;
        d=google.com; s=arc-20260327;
        b=mF8nLE5eHNSvcpSLAwR09MC1w6emWS9TIEEzt3DAe1gg6dmHedz1pUINKyFA6UlP1H
         jS6OMqRExrZeH+wEJ66ftrUIrRgEWrymaIIPwUsCNLIrrDJ2deK+9VwdvwlOLzfG6f+Q
         1OD8zsn941dnWSTxPZczslEKKqY17F0Rjkagwb+x2/xPhB2MSxq4SuumTbqUbI4hoaqg
         wZTqmH87CJBWX8kx0QIUqLq/yRx0HRnppFtkfAYvMdgL6t4wt5GLTsFHPYtUgopgKS+e
         MpSiHlitPMZxX2C3DsIK1Fi3fw3MoLUA6BPaFvkgOYZqcnqjURqXUu5CtHaNu9OCEC9/
         AjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        fh=Q3HP0SqRgae8RbMjr2YKYlS/B4GNz6YZuctVRQvqVuQ=;
        b=F3N0ABDNxI9zBSGi9pKUdI6Dhv4gWELw+rGnaejl3T9OAlRXf57TY9zr8KISTY4nSX
         F939xbl9e+MMwrTu5ZJWuYq8PS+vPvqs+tapwM4KS6U9aS5VhytpTciipwhjIVEdNQMv
         vS88T+kVq/tJlY/l+1s1UFf2Zq2DDB4qGftN7vCv/nGQ6SbBlqzlPU9qIDOz+2s0Qz4R
         j0vMCbU89uPYH5YOvQ8aqo2RElNRfgs9dWe+L0mc5BQoLiNo4vsOizBfgGXfjqvqehAP
         ZVdM/c4fhWPkI56EC3vQtxdhwgtGcGrOT67Ez1iVvcC+gvoy+bfkHtUnMW0/bWc5QvPb
         4PxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792481249; x=1793086049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        b=BSkiROCnNX58runhrTm481OeUe6TigS9vHK/+OpJrzISryqv6gzY1meZWXeXBK1TM5
         AC7OWBag1lIVxMOnonE9yViTuJFz8+NjIchY6oIM0Ms7rn26hIQRvp5350SzaxDi2Nr+
         AYxvqSFKAaVltVGTHYxUVSgKHGctsooVeSkzQUa0cEPLuxd6S8zkBcNqsYmZYludnRO7
         27/rpaV5jOvsgxXEYRNJPK06HDStg5yCj8K1nDSd7nR4jNMl2inCuFYB6qSlTIsDKgQX
         d4bolP76Dhzke2KFbwjisP6mXoxnu/0jLFvoOr3aGirCtZJLBN99e1IkjMwfT0FPYvyA
         qhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481249; x=1793086049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        b=XBViQv6cZRaq9DXq1PtUswthqu8tAb7vcQotvDevAhsGtz+umzaRLeC3jauib/Yn53
         XPwj4q0JSittH/Zjl8ucxW+mtUjsIfNUY6YUyWHcZBBA25+HykatTmJzu3cy1v52sVjz
         zh8xVsJ5F71Fkh0f59zkmZ78ai5JayAYPCOGPThfqIhxWYW6XHGcO1TTA0spmQemF32Z
         fkCMGNWZ2Vn1SsmDyRBvhSYwX/Yo4GgWJHNYLZn3RydUDyVnEDmwMlvvYfKalt32YL4z
         YIcbD3kY/QhaQuoH3omlRhaN2rnrwQA4yc5MzWhRMpMjcC1y3Yz8d5eYtwuq0XqtrkGY
         1Nvg==
X-Forwarded-Encrypted: i=1; AKwUvBw9aqIx4MH+3uUlgEkURo7RZ0t9fe5oR+/i57sR3d7pPmSmPcy49+8lQuYcwva2YqbrvLbpCvfiCN+/@vger.kernel.org
X-Gm-Message-State: AFq9FYJv9LovJMJS4xcU0xWYhUfK3SDuSmMbT51UfHcGpulzsbp4Z+n0
	9+G8KICWM/jGEms8QGk+xTkpw3l+tKa7Xj8mPtccA3EjBzBznC8s+QRd1gC25CeoevqWyxoXBFI
	Mol1Fvxu1y1OxGYmiPc5vVrjiQSjU+Us=
X-Gm-Gg: AYBFou2HLhi2joYohQaqJPA6CPq0oJ1Hp5VG8nbFfl6t1WKy59pqDmbButXp3OZyRXm
	yM+GCksx0szoFrwHs3IKhMS9PGgIbVfWOZydv8lfch/SBdFD2WPvY29krGslCbLVslJ5B9BNqB8
	VzkXkRTNpvW40My4BNHNrt9ANVywhMwmMiis8xhUCc01wESyZkF+dwuMgiLAxMeonLyR4PJ61ew
	Z5XH7TMVyPF68SXxccryneo9zOJfV0gnNJ1gJ959VRIykZMh8qUG7GS0Y7oT4HjWkrNoopku45U
	ApD+u5lQYD051JMCNTrss/7PgqwOn7tnvH3EpaiT7E1ODkJABsTMO1AtpoGmK3twpadcnld6VFl
	4oUF71fdjSMIr
X-Received: by 2002:a05:7301:140c:b0:34e:67d0:bbb4 with SMTP id
 5a478bee46e88-361a0e85fdcmr14132186eec.10.1792481248787; Tue, 20 Oct 2026
 00:27:28 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
In-Reply-To: <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 20 Oct 2026 10:27:16 +0300
X-Gm-Features: AclHuK9h-tQcbXrVM0viwwPsC9zuaQ4jRTMIV3P7VlE38_D0lFsuAg_ZHkgq7SA
Message-ID: <CAPVz0n0Oiok9vx1xmTPPpv8+iHCfL4XTE+D3jBMc1rUUHAftMg@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
To: Florian Krischer <florian.krischer@fkr.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 20 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:5=
7 Florian Krischer <florian.krischer@fkr.dev> =D0=BF=D0=B8=D1=88=D0=B5:
>
> I tested the v12 series on an ASUS Eee Pad Slider SL101 running Debian 13
> with the 7.0.1 postmarketOS Grate kernel.
>
> The system booted successfully. The EC identified as ASUS-EP102-DOCK,
> firmware SL101-0202. I verified keyboard key events from the EC keyboard
> and touchscreen contact and coordinate events from the tablet's maXTouch
> device.
>
> Tested-by: Florian Krischer <florian.krischer@fkr.dev>

Thank you, Florian! Your feedback is quite valuable.
