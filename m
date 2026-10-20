Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523052;
	b=TcLMlb7eEsxNidPFme17Xda+IDOGdclNRIO7nCDo+pYMWPEhWl//weJ4w8IR4Gis5sUD
	 qK9XONluCk/m0gQoPwig4UDaTKN3+pLNEXn5Titcx/bFifkaMFamgNat8kVXyXhcj9Cmf
	 8O6yktm6HGWffIUFowaWbkQEFSydM7T+fA1CE3qaCTAJDhmis5xcSXa4+Je1odSVyqqNZ
	 HdrKBjgv30IAiqy259jmZXNKsCxZPcFfxnGDV0wZiVZy1fqzYZ+0uA79SShDOcwYlFN7c
	 Q9d01gEbjgYGyWOxSctYoKayqbHcgnJ9Z3p/nr+QwvqSPY29ud0EoLDnB4wO5ShcDqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
	b=ACj9kozQdKGdFsNkqSbFuJcSVvK9y0o3DQ6g5nq3ZWverOiIPw3gYnQh5UclEnPQJy88
	 0ESfQ5l6XvNEwT0ZkEl3p8Rg5VDNjQ2GVraL7fLZBnh+OgBm+MP0sMNFXM2spw2EB0pyu
	 kvi/HDE5Y4OdgYZEJO5psfiKJGuFzkSei9MVabVX41uWZYkIvn6/ExDvYjMoLv9NcrKN9
	 tVCQctXx2Ooe+sTn9cSwoF/GrSjnSAU00eVfPrb1FhblgxwBrLMT31mOCpSlwgDySFH/H
	 HIccbvc9UeJ6+kNQRi92AiqzroMCoOmkrUBAoy30m4IJ9nYo/Rah7razYcGjBDx3EGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLr4Pt+J;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B30606A321
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 19:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B30606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLr4Pt+J
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so4511500c88.0
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523050; x=1793127850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
        b=hLr4Pt+JNnJwfVdSIiwSzVwN2M1EdektMGoj8qGvTIg2MHi43g6P3LOjqDktLIrXJc
         /LbjGbnm0fv1Cio5pJKxGcmBKzdvQ1Bf8jSuV8V5JJip79CY3ECKV2x7PotCCn1kvzCQ
         4YaZ8G9IpdE+7Ow3oYO6+adNmYfrSPrPRZiHksLbJk7N1fryAL33UOp5jSq6Nup2ngpH
         wOl0+Aik0n+dpNKqrXJHKnb8BU2rkXjhhP8rhu7nQdn7ktiO6XlCo5a1Jmr294bKdHsr
         TPkfN5DqX8YEfDV0yTlKP0LpctSqRfqyj58P+bLiOitnTlcAmXRX4sdFHQMGgmS5yS9g
         opWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523050; x=1793127850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
        b=Ea0CIV5hxWaAq8AtXhSSpBiUp8tB2aNodHB59hVseZ/amZWiAZPeCy2IdHNYXnSLo/
         eCbZvtharoyA7EJma0Cg9qFBq6an6PzEHXiZO8txtue1ATnwkvLzskIg8W9ckCaowV9F
         qsEwMZF2RnzUmH0HS7cg5XGW8KEl5R+TVOMVCDKjnUOfmuxhOmoGc0jcP361TL1B0SEN
         lTK4UJrFSWGRuuOi6UEttIRpnnbmcnpc5DNWLEZVv3jmfOab+T65YFJlXgQ6w0NrdYa5
         RDgGiTtYDCLjQnavEhrK+uc7CHgsqloz1jSlgj7s33ZCV4ilmtYON3kmigPACkzfumWe
         Cx4Q==
X-Forwarded-Encrypted: i=1; AKwUvByOgUsv8Qx6U+0odkbeFA9Ys86jVXKqnU0OwCAYLXaP9kmzl7bm60kyCuPNGLKpyqb9lQ4E7La83sdU@vger.kernel.org
X-Gm-Message-State: AFq9FYLMDrpZbDNB8ZSjry+mVkTw5/Fh8RnFp0Z6Qd7ysyGgojJQkQrL
	bCC0ZcnXeXSijb6/5alHtzdi2RJTvvYIIVml06P84+t7ZYdEE5gVFAFb
X-Gm-Gg: AYBFou0oSMAPKFnC56YRPHQaA0byBlYu+ZcuiXw5EftGLPet1o8/EQEnqFji0G6Zj66
	CRQvlF61eSt6k9QsEraecwcufz6DWxZUEXDUn5NFd8s2V75SCxksi3YH3Lg93jimRu9mQkC2rQj
	ImIrRQDkG8eITkMVBFK9nMjF9aDd1sX+E9q3NeLUZXuJPZ2MCm69gRO/63YLmWFpSvme5pfttSY
	kl0pUS7sqer2qPxGnQypndvvY8/DbrzfxpbJJnc4h+h2Bqg7ebj3y6rm/BA88rMmAttcMmfcGH2
	Yf2y6ol/E5VjFMTid9aVSIFQ7juTi3qx+QW1kxX6Tzo0yWdSGJ8aij6vxcSvyx+agba+PPFL7bV
	Lh5vN+vobR/lIWvN/6brhTzLe5vQH7e11oMbeHVWqRvCInwzr+NpC2QRd4cWKzZ8u5hXwYlRxGj
	JXclTkiWfLUWZ33QKsQGYQTtCzOBSPAAhzjKxNPSqSm5fAVmXpxWzNyu8WW5nbjgobzd8qrMvSf
	GjNts2zu7YvSADTsgt85PHO9SAVegmOWSNZnE4eiudvcgfRDKs=
X-Received: by 2002:a05:7022:e804:b0:13b:3132:6e99 with SMTP id a92af1059eb24-18512c38164mr17695167c88.20.1792523049985;
        Tue, 20 Oct 2026 12:04:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aefe90asm552320c88.9.2026.10.20.12.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:04:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
Message-ID: <ate5K6ZdrSoBUI08@google.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-4-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019100406.103687-4-clamor95@gmail.com>

On Mon, Oct 19, 2026 at 01:04:02PM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add input driver for ASUS Transformer dock keyboard and touchpad.
> 
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> +static int asus_ec_kbc_probe(struct platform_device *pdev)
> +{
> +	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
> +	struct asus_ec_kbc_data *priv;
> +	int error;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->ec = ec;
> +	priv->parent = to_i2c_client(pdev->dev.parent);
> +
> +	error = asus_ec_register_serio(pdev, 0, "Keyboard", 0);
> +	if (error)
> +		return error;
> +
> +	error = asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_AUX_SEND);
> +	if (error)
> +		return error;
> +
> +	priv->nb.notifier_call = asus_ec_kbc_notify;
> +
> +	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
> +	if (error)
> +		return dev_err_probe(&pdev->dev, error,
> +				     "failed to register blocking notifier chain");

I think sashiko is right that we need to register the notifier first,
and in it check if serio ports are ready/registered or not. For that we
probably need a lock and set pointers or flags in serio's start()/stop()
or open()/close() methods.

This can be done as a followup I think.

Thanks.

-- 
Dmitry
