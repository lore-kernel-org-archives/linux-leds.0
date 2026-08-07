Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023EB2DCF55
	for <linux-leds@vger.kernel.org>; Fri,  7 Aug 2026 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085172; cv=none; b=d9YsprXz36mfPA98lgC4DegDYp0vI9FDMNpwXcLUjpAVMbNvpNOcZeGTxaFUzV6SYr52bOIOfVizdrUdJjrVtf0PMG6brvrN6K/4JW4Aqwx2jJkigmVFADw05oTuGdQPH8+mr+vBtePL2Uhzl+qUJceH9HMpwIdodfgzX6lGQLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085172; c=relaxed/simple;
	bh=Eq81xTU6unw+QhgDZGrLcP0j5hAsW/46xnoeNiiM8is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+e7k2N50dhJQT0todlF0Qnvoe8m6nlJTI8UbPdLIfF4jHtz/hQ0VaXKzU6Gwnl3riEJtQ52+G7b6nmGj0MSI0fWVQBMM9ra0irSDs/3NVjmocY1fVEHrA8kfzF4DSETqWQPYtrc1OPr9REemCVPieOmLg8DPEoiXuOHwGNuq9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OKco9wO2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OKco9wO2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4955de8797cso20165075e9.3
        for <linux-leds@vger.kernel.org>; Thu, 06 Aug 2026 23:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786085169; x=1786689969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuxZgv9NDap5lx/vLVQf2iAz+mvVDGMWBjZuHXXwkDc=;
        b=OKco9wO2HgiQ2sHHMKx9tcZeBKCjk47uROzMk05jaAbXk8+STKCyhV20X+AnJ2waSX
         QshdPkeRjudqWRGy0Bef7pbw35Yhqpys92MIk+4wedD36FRtIJokx6ikjjOhGeq9Q17U
         N1jnCK5ypq6Xb5G/TtZGaLocNAQuEvmK6rXOsbw5Ie0U3rAPP/uX++/N2oJHg5b4HwDH
         1DUwOxDwDGqUq3L7Zauk6j+PUXdRrx0e0Wx/QFBq0wmL063OcOld1kLxQKKGryvklvx9
         t/AaQRXnYMCv+J5/LCoL9Bcni8tTaZtbEoY2T811Zc85Wz06kBHkUg4OPdPlmOtdRiDP
         VydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085169; x=1786689969;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuxZgv9NDap5lx/vLVQf2iAz+mvVDGMWBjZuHXXwkDc=;
        b=CBxAEnAa5xGxxWO0pTy8Gal+BQgEtxh/F8w8XnYS/+kDptGJK+MewwQ6NN2y3pwnZK
         nEmEujl6hW9kkhCDFg8njM8ITwc/Fp9oyM4GPzSHyoDPIeC0j9TMszkukvy2cqv94AJ8
         IKsmkqMOhXvkhZYduoQjxXaG7kkHe/gXtvuNuDQxPs2aUompfh0xcZCIJguP7NbCDtBc
         f5ktbLLTa9WBbpSLwBh8QFLmmbHtT0XM9AG9HOUmajO75n3LOOVdDO+Qo1WppXOpM1fX
         IHV+h0BMCYL7x4gpHQfcMMjzNafPCmTLWEXnQRyR6CqnZVpVsmk+WFleiTue6Cn5s/4e
         qrwg==
X-Forwarded-Encrypted: i=1; AHgh+RqMWZAEFRZM4cRAUZGwZeCtDkgnhpMpyf7lNtjp2H31LUrFmatPlr65ZhTYsCq4zKAOrIeu1kameAYv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrk5M72UFkWiYmyHLF2O3uX5xizbS4vESvYiZFMEjBgjyQzmcb
	7Sq5eCkyZziB/yOQIfJfXkuowwn96N2SnseeRdDI8i65yGmxKQOHedJ6JuIyBE3wNr8=
X-Gm-Gg: AR+sD10JqLp3jtbSw+flW7dfSuD3FugtTL7DSTeS2SK7cNPP3tu9822xUWinkZ5mNrU
	13ieCIEmvDM0MVHT8uYXAncmeVFyN1/90O6wNEuvsRO/mrulVk5zvhuf52o83NQJ0mX6sOkI1Gk
	Ar3C2M1Y2Hx0RCKXLLeMJs/AwILU1SdkIsAGF/+K37mZZo9e1F4aD02wlePL/T1S8yGyYIu8t+b
	FBFAs7GMkGoUPTzaOfgsKNYarFEMy6O68oFIeQpo8E3lxo6LKKiB7Z0PgHF5TcSngc3kZzZt3gS
	n36T78VgNJkrxnN7561UaUyQWZg2VLXuvyZegY1SQA2g+sf/BZ6KrtXrTAVG4GoJEFmgqF/C+jo
	bg/VCAhMX1micvp3ruoC1yswplKanQWh7zueC4gzrkg6Yu+1FBpsdQHVWeD2bVYNOvqEVMqJLbG
	Phn2R4ualp0eno/Y9Ksfu3zSvTR6/pWZQ65m7l7nX7M6BwtWsRS19Nd2U02ks5NC2rkoZWEdnq8
	d7cHzKvFMo9o8a0tf/NjKCRPuMZZn5RX3CDEpG2/A6zNa4LGTaq
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr16033505e9.7.1786085169192;
        Thu, 06 Aug 2026 23:46:09 -0700 (PDT)
Received: from localhost (p200300f65f017104bf0aa590e17c3201.dip0.t-ipconnect.de. [2003:f6:5f01:7104:bf0a:a590:e17c:3201])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995ea2e038sm9844665e9.14.2026.08.06.23.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:46:08 -0700 (PDT)
Date: Fri, 7 Aug 2026 08:46:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wim de With <wf@dewith.io>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: Add support for Orient Chip OCP8178
Message-ID: <anV9EBIaZvoTz-lp@monoceros>
References: <20260806201541.101304-1-wf@dewith.io>
 <20260806201541.101304-3-wf@dewith.io>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iwu3m4uskszqhttb"
Content-Disposition: inline
In-Reply-To: <20260806201541.101304-3-wf@dewith.io>


--iwu3m4uskszqhttb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] backlight: Add support for Orient Chip OCP8178
MIME-Version: 1.0

On Thu, Aug 06, 2026 at 10:15:41PM +0200, Wim de With wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h> in new code.
<linux/platform_device.h> already provides struct of_device_id, so you
should be able to just drop the include for <linux/mod_devicetable.h>.

> [...]
> +static void ocp8178_bl_write_u8(struct ocp8178_bl *ocp8178, u8 value)
> +{
> +	unsigned long flags;
> +
> +	gpiod_set_value(ocp8178->gpiod, 1);
> +	udelay(OCP8178_1W_T_START_US);
> +
> +	local_irq_save(flags);
> +
> +	for (int i = 7; i >= 0; i--) {
> +		if ((value >> i) & 1) {
> +			gpiod_set_value(ocp8178->gpiod, 0);
> +			udelay(OCP8178_1W_HIGH_BIT_T_LOW_US);
> +			gpiod_set_value(ocp8178->gpiod, 1);
> +			udelay(OCP8178_1W_HIGH_BIT_T_HIGH_US);
> +		} else {
> +			gpiod_set_value(ocp8178->gpiod, 0);
> +			udelay(OCP8178_1W_LOW_BIT_T_LOW_US);
> +			gpiod_set_value(ocp8178->gpiod, 1);
> +			udelay(OCP8178_1W_LOW_BIT_T_HIGH_US);
> +		}
> +	}
> +
> +	gpiod_set_value(ocp8178->gpiod, 0);
> +
> +	local_irq_restore(flags);
> +
> +	udelay(OCP8178_1W_T_EOS_US);
> +	gpiod_set_value(ocp8178->gpiod, 1);
> +}

Is this function open-coding stuff that already exists in drivers/w1?
(Just asking because you call that onewire).

> [...]
> +static int ocp8178_bl_probe(struct platform_device *pdev)
> +{
> +	[...]
> +
> +	dev_info(dev, "probed, brightness=%u/%u\n", brightness, max_brightness);

IMHO this is just noise once the code hits mainline. The amount of log
lines like these during boot is just annoying and makes it hard to
identify the relevant lines. So if you're confident that your driver
works, users are probably not interested in that line and you can drop
it (or degrade to dev_dbg).

> +static const struct of_device_id ocp8178_bl_of_match[] = {
> +	{ .compatible = "ocs,ocp8178" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ocp8178_bl_of_match);
> +
> +static struct platform_driver ocp8178_bl_driver = {
> +	.driver		= {
> +		.name		= "ocp8178-bl",
> +		.of_match_table	= ocp8178_bl_of_match,
> +	},
> +	.probe		= ocp8178_bl_probe,

I'm not a fan of aligning the = chars. But opinions differ.

> +};
> +module_platform_driver(ocp8178_bl_driver);
> +
> +MODULE_AUTHOR("Wim de With <wf@dewith.io>");
> +MODULE_DESCRIPTION("Orient Chip OCP8178 Backlight Driver");
> +MODULE_LICENSE("GPL");

Best regards
Uwe

--iwu3m4uskszqhttb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp1fywACgkQj4D7WH0S
/k6jeQgAoLN+VXXOB+z1f0HbZb9ikcQC2mevDd4JHgtRG5bJK1LekQ92vTBtDHGL
5hOxcoN7X7DorPQZt5zDoq3PNK5UsyLgdqJ/CqlIOrMccsctk//nNFo56WWOkxfz
h5TJ6Czia5t0ELTDvtse7QaRDg9cGvpecxIhAuUFd4g2DCwROUEdO4y6m7gmsAUt
deIIMXTb7K5CKQIQ3zju+QKd/bNxNnEcxcZiCDxRJGpGjzTmWihSCayXP7vPTtQN
Tm1Mi/MBwcbB9Mqz03LSGsp6UNLZCUcgPYWZrix7v/MtfmfA/T/IZzjTZNX5jLVY
nWDYA61X1eCKGjX1tgCngtThRezv5Q==
=aE0N
-----END PGP SIGNATURE-----

--iwu3m4uskszqhttb--
