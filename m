Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922888;
	b=CmwQCHPDBgIGCo8v0e9UGRqzsubgymD0fpI7Mzdzmebu3XJW7f7rqAlADNqNts/CMYfJ
	 Re2bxVipCwKNJoECEyjM5x3e+qtOqMtWVDpxwPtiZACXUWtqDHxIDmRV+4BHmcL6XLmyc
	 KYeKbOuWMcJ5Rdkf49GZkJUUxbgrOL2d/FnLkpy40x1pVJb0YkC0qrqdniDt48XXEqWVE
	 ho1vKzfnrk394CD4dn4PMWPRRSXy4PnJ1L3iXInilJFoOPVv9rBl1ZCoAfHubFpv3ultU
	 JFfsBBWWg1kIkhiF/g/YjsncquzL6LHZswmJEb4Xtw16MdfPSdTuVGnMga4I/1qItNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
	b=BAi4aOsdaz2+q6qLAka7gtnpL1cN5znr9F6LEKlvY1tQQAsVMzsrw9aLob5KaFaf5KFj
	 3CDhHce/RoyjpxBxwvaUhpD38IW2AYtV3l+RXk4UHJRH+DzHTOxM/OQ/+xOIwBjUYuCSQ
	 ZTYEY/QvKOwgXcLe3TU7b1nzO2Q7ah1u9zLnBVeU2Y3bsRcP5KqdenuzVRRa7r5ymWI+Z
	 BQAkIkXJMpbndG0bVOqeH+Cs1H5edQh8Zvflrm9KayyblvlPH75Rs26UhBx68KQMLzHhF
	 5zibD+v9vhjcUHBAHB8bT5J8pvRYxEcGYH2VFb7pvABjZjlUVMVYdxNUpq2W4RQFOjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXZD6+bO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550CA606A33B
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 13:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550CA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXZD6+bO
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso4703565a12.3
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 05:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922887; cv=none;
        d=google.com; s=arc-20260327;
        b=HIuJcJwigM5GnBRH+KlzxCV8Nj+Z1sOyJe18v1Z/6ERuO7V+33NoHe2kwt7X2m7hLB
         xF4Dn7xWZ5Phoi3nu2SN9IHirfBL5jXN8FuUEDc4ALrlCcB5g2r81wQh7FQ5GVQmO6Rf
         6NlCkz2RWvm5hPPqSJ5hUPTz1aZn3xNkf0HAOR2ZcxoAkWV9bDsR8SzgyFv12nIoGJqx
         TpFusVU8V8HR+CwFx0/hA4a+EhQ0mbYLZADDjpjFFXWRxHTT96+xXKOf7yy3JPQjhO5M
         XRQCHuLjV1oFlcMvJnR4wkAw6Eh5nKaZLq+iYn57qBh14gvR2okIG1Kbb3Eor17MM4Tj
         yXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        fh=MZFqL8LMQN0oYFsZfSyUkYWKeXRWWpNaG83HrzFX5oU=;
        b=D1aM5TLoNFUwj7kqksaRc37KVrXRVRygBfhuINbz67Kq5jNZPdd6bgMrL2gV2AVHNM
         n+o5S8ShfEUGtQJAyuQ3/LRGlLz6ChspYEy/bcc+Glr4dpUbfG0+JQB0r+ZiNFtJGFJT
         V265A8NYSkW+e5FmKhNBAMFPAfQea0zi9Lkje+hbbynPO7V7SP1KiWSaL7y3xgu0RKkH
         DT59wpuTC+8S8KWDqQ04hQkd5DkQVIcLUQeFECtm5WZxM+AHuCJaICQuTOXTBTQrjEql
         zrg7R8PDVLxMnkOgX1IMDSHQX4j/Sm7vvYRnUOHuw5dEBLyLTnIqi/P/YowWsm9fKL7B
         q4tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922887; x=1795527687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        b=HXZD6+bOfJsqVWxCIDhCrOX0w0tZU6Qb/j1uDssVapw+Ww7+0R3+poAelpj8hd30Uk
         NRHXrhn4tct1eSaoNp46WjRi+tv91i99TN22b1qevYVL8cvYI0iyYdiFa5yTKzolgHGk
         8sMne0X5x8cIw0Bn+YjBIpGqXPeglmO0o3KddQI5WHKRGiS6xUDAvsFwtqDTgSDDmUSL
         MUkHm4nVBccOcAud4fo/vDh8WhsTW0pzO74y9BjVQkHMK8lO86VC/EoMAjY/vl22CH/Q
         ECbYDcJOPfeAOCjCZgumewFmNWl431+UgM8dmy1CPsxOhFPEuqJuAjaGLdXJ/yTGpMMN
         GXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922887; x=1795527687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        b=LqtKChl7FrjT+IqFXPH0ImBONDfmAkyi+vheiz8K30JYmfVlpJYo96lYmDPW+HwMk5
         QZy6vUFhJxtFHSGOdl9DL+b1thHPEkMOWbtmDWnsmEzvQVZhU5JP7R1uSW2xd92/rISF
         gW7+uSPzQloUKIihGrP/V5ErELqOUPeuaLCH1RV/52MxaibabqXM/bdf/qRJMxAf38us
         ltF6XUqtyjnWsXpGXnHi09egfQciDIX42A2CtoA0qjausylNt/C+7onSiaSlwW/kdXid
         J/QNt9G4EV/Oizxk+DOjjTN+Fz/C9oxXeDXbZQ5Mkb25YAFlO8PduklgY7F1Xu9JhKMf
         D96Q==
X-Forwarded-Encrypted: i=1; AL+hErHiIhk3Z4Gxm3EVgCKNiFyje61kozljiserpH+1nrr0JiNtghJOIx4a1AjXhAKRfg3z5BJ2/b8gqPsL@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fjix5iWvYA366X1oX7MMuRObhMRzmKvutZqAayjEd/ggg+tas
	dtyH0Xh+OsQzsOx+kD7WKbfWOJDfu2opDp/PQwqM7t5zAvBUfL0F/98Mx9toEMcL+d5n3w14u7k
	T7WWyS9u6mpYDvhzoDFD51qFjD6dYols=
X-Gm-Gg: AYBFou3eqFZk33aFnjPxY3tdJUJANgOtzQXOCwZ2cHUJpRxIGsVn4sN7ek649VrSh+Q
	IpxDM5T98aX2Kpq0Ux8d5gc5TvgCkM5drIa4BOiaZR7yin0KCmdNcBa0DbUIT2jD08/h3j+xANZ
	ptsJpcWx+2spx/lUSc1y1n5Iml8M54bgK36KFiP1tInmkTJ/7Nvjor9sE3kIU59t6XyKaDANgD4
	x1tUmH07cOakS/r+V4U9Y0ecyJKgK2YOkus7Bh+TiK9lfD+O6kMXcv+h5Q4BhEvTmE06Qts8xed
	BOG88OOhZ8aXE4yyWqdsQvmBq5266fgytGAtyW+MQilFTl6jUaZ3PsjJ1HpqZD1+/FEVMVNd4g7
	/RqYX9HZiiYbDjY//Z6t4dGrF+1fMiDd7Lghv0g==
X-Received: by 2002:a05:6402:22d0:b0:6b6:966f:28c with SMTP id
 4fb4d7f45d1cf-6b7c0bbe6f0mr8200959a12.11.1794922886352; Tue, 17 Nov 2026
 05:41:26 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com> <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
In-Reply-To: <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Nov 2026 16:41:15 +0300
X-Gm-Features: AclHuK9B7NyGEv7s06EQ-PBXvC_X_ioRVUg7CDZFlHxN77tZjCz1y9ac7S-od64
Message-ID: <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Nov 17, 2026 at 4:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/*
> > + * LED_COMCON force mode bits:
> > + * bit 2   - FORCE_EN (enable force mode for this LED)
> > + * bit 1:0 - FORCE_MODE (00 =3D OFF, 01 =3D ON, 10/11 =3D blink mode1/=
mode2)
> > + *
> > + * Only ON/OFF is supported.
> > + */
> > +#define DAP8211R_LED_COMCON          0xA00B
> > +#define DAP8211R_LED_FORCE_EN_BIT    BIT(2)
> > +#define DAP8211R_LED_FORCE_ON_BIT    BIT(0)
>
> Given your comment, this last one is not strictly correct.
>
> Otherwise, this looks O.K. Lets see what the LLM says.

Sashiko said only [1]: Sashiko has reviewed this patch and found no issues
For some reason it replied only to me and linux-leds.

I'll fix the comment and make v3.

Thank you.
--
Best Regards,
artem

 [1] https://sashiko.dev/#/patchset/20261117114432.2794961-1-a.shimko.dev@g=
mail.com?part=3D4
