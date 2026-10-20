Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492373;
	b=wYfoWTB12i2DfGLHPCHV+V0GcpmYvz7tNwYS9CTgcd4vGBOef5/Q7Fwmx0grDsLmiTkt
	 B28WB224rS0gyOhJzZTJrxjjyOJh+lMUfns2GTAoy6qoFncEz9Mf7nfNwuwmGrfQPFXEv
	 m52GBvo0LNGNukuMEEWP0r0a6SEuZzim/KzzJwZNhyxVjZGJv5+QuRZhTeyZWp0aWqxCp
	 q5RG6aO79LWrpSUXEn6fLkunmfWHPD2RJ8dX0zlbxfAcHX2jXAcMG+FnYuSlA3iTmW6bs
	 4cWMPvm3m5BZ0OJFWHs7hxi7cdp6GSF7BwKAKsdIJZCUXXs46rlrIqrJFv7diaofLcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492373;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=G48PL0tn1VYTaXsE0CA/o2f0ngz2pO+EXwjhRCct9GU=;
	b=HA2o+Bmac7DRXqfyf90Yi9dKm+FxhAc1CctGRPrJ1Dp8IFqzqk797vOKzgAquUj6LTWG
	 bGZ/361V0lmKEyhK+1O67tqIh8Y6k49lvdkcmomnytM3Syobr/NkHpnf8v7PEXv0SHo7x
	 3eaZHOoP6xQmSpM4DG5b/qJnHMOXmOGrBUas4htq4Tc+WdEO8w+wg7jvME2HnvtVgvtFn
	 jNznSSmkKS1tc3fDeNRyxuccqRbY6uLatE+agMM/KZKThfMo05dnUwaTbfmqirmX+TjFP
	 VB/0WH0s4viuaj/u10sM5XS7lNFuniU8bJ2EC/AO2iE/edOIrk2Ay7ibYtNjOrDIf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmCsMbOt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1015606A31A;
	Tue, 20 Oct 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmCsMbOt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B3F1F000C4;
	Tue, 20 Oct 2026 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492372;
	bh=G48PL0tn1VYTaXsE0CA/o2f0ngz2pO+EXwjhRCct9GU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CmCsMbOtkVhG8+5EY5epF5v7VhGTsfehD6k/FI+5xmbUx0urhxXfRsGCuiS7Or7k8
	 JDuDpCaxnAHhQzBrHeGnkR0y5ubZAsd3bJ3IxzmPrSTcwqUWL+C1n9c05rHOqyjk2i
	 hpw+9mDMr7PBJCObm2V0d7P8ApNHH+lAg5s/WUdInMKwkIPYmeuwR4hM7gean4M006
	 5/61zIM9lLSxJb8bi3L35bWFehJ63BJCrGO9H1xa7VoS0OlsaVYCLlUI8MVZLB6946
	 G0Zh2pLSTpU5Y2/4FgCj+gDEJBz7eVBByd2GVdKHsGGUhkHg8XSh0duqnU/Bn89lwh
	 3MByZaPVcr/eQ==
Date: Tue, 20 Oct 2026 11:32:48 +0100
From: Lee Jones <lee@kernel.org>
To: phucduc.bui@gmail.com
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] leds: lm3532: Avoid duplicate error messages
Message-ID: <179198414722.839288.1086260869798370727@kernel.org>
References: <20261009091059.25729-1-phucduc.bui@gmail.com>
 <20261009091059.25729-2-phucduc.bui@gmail.com>
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
In-Reply-To: <20261009091059.25729-2-phucduc.bui@gmail.com>
X-AI-Review-Draft: <20261009091059.25729-2-phucduc.bui@gmail.com>

--- checkpatch.pl: clean (0 issues) ---

On Fri, 09 Oct 2026, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Most error paths in lm3532_parse_node() already log errors. Add an
> error message for the devm_add_action() failure and remove the
> redundant error message from lm3532_probe() to avoid duplicate logs.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Please capitalise your name appropriately here and in the 'From:' line.

> ---
>  drivers/leds/leds-lm3532.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index a3bc9680dc4c..05856c053fac 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -566,7 +566,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>  	if (priv->enable_gpio) {
>  		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
>  		if (ret)
> -			return ret;
> +			return dev_err_probe(&priv->client->dev, ret,
> +					     "failed to add GPIO action\n");

We do not usually print messages for '-ENOMEM' failures.

It was better before.

>  	}
>
>  	priv->regulator = devm_regulator_get(&priv->client->dev, "vin");
> @@ -708,10 +709,8 @@ static int lm3532_probe(struct i2c_client *client)
>  	i2c_set_clientdata(client, drvdata);
>
>  	ret = lm3532_parse_node(drvdata);
> -	if (ret) {
> -		dev_err(&client->dev, "Failed to parse node\n");
> +	if (ret)
>  		return ret;
> -	}
>
>  	return ret;

return lm3532_parse_node(drvdata);

-- 
Lee Jones
