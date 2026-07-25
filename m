Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E631E820
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 08:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967579; cv=none; b=gVbWt0YRzfcWt7efPfOzK8qaF4CHYs8kTJdSWzrs3ygAqPIzhppVMiEbQEeZyCuwT70j0RTCoLCAxNJ5BZJR4NEiDmgPz8gZxf2I0KB2mnhdunCz4vwqvmdJPgBZjx9aRFFcInRJEvRdGLcO1Xe/3HpUGKXshAAi0K3VsIpilf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967579; c=relaxed/simple;
	bh=/815MksH+Lw7WdEflD3R35NtoHqecqWZ8VMwuSmkfdg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AOcOTKsCB+laYhq/5IwLs/bIl24XBhen3YW8fFaprfEYJHfoxHBSqtOvUSaYrQ9La60xkctwmnxa1DGk90znHFZfyNTGYXA7eFVfP3irB1otJK+WyulqkYARjgADMbHqMG0nZZ6e3ClMI79KAZsAgWSdKv8Fg187ZulLNtc3K/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gxm+M02n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gxm+M02n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422B11F000E9;
	Sat, 25 Jul 2026 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784967578;
	bh=XCL8581iJBAus3pvB+IItdg1EefElnHGSu5dMzCB2V4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gxm+M02nKJz/yyKqw27CIJJJaRLu2uXrpCx7QC2ao+1ZaTjPHBmukL/axjcv83KVz
	 /TVnNShHWcFbuyf7lYgXUFm/j1+Llzs9hBTU2KDvaTCkYC1p4/apTrUw1khwWJMzqX
	 7Wnj44ZjhhwwwIllxcImtXv0305fyTPZdgzO0hgrLq3FdTYeuR8P1aXqbIwtfCt+DU
	 rP/Jhw6db5+e3U1AgaMlDIknmpnTJOwxSHvSNaVs4Spalin0Vds8YmRpld/3ys3N4V
	 mBp/o8n2eR/SmjbnaiLc8NuitgguDMbbRLxp37hTCji/6hprD4S9+Zhv7CNg7mfrMS
	 1L4uGzDVKPqdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] leds: menf21bmc: Convert to dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Arunachalam <arun07172003@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260725081349.8556-3-arun07172003@gmail.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
 <20260725081349.8556-3-arun07172003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 08:19:37 +0000
Message-Id: <20260725081938.422B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `menf21bmc_led_set` function sleeps but is incorrectly assigne=
d to the non-blocking `brightness_set` callback.
--

--- Patch [3]: [PATCH v3 3/4] leds: menf21bmc: Convert to dev_err_probe() -=
--
commit 47baf6269572a611e45209e561552d7a4bd3af39
Author: Arunachalam <arun07172003@gmail.com>

leds: menf21bmc: Convert to dev_err_probe()
   =20
Replace open-coded dev_err() + return pattern with dev_err_probe(),
which also handles -EPROBE_DEFER correctly.

> diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
> index 6b1b471606026..a7e4db4879d81 100644
> --- a/drivers/leds/leds-menf21bmc.c
> +++ b/drivers/leds/leds-menf21bmc.c
> @@ -84,10 +84,8 @@ static int menf21bmc_led_probe(struct platform_device =
*pdev)
>  		leds[i].cdev.brightness_set =3D menf21bmc_led_set;

[Severity: High]
This is a pre-existing issue, but does assigning this to brightness_set ins=
tead
of brightness_set_blocking risk a scheduling while atomic bug?

The menf21bmc_led_set() function acquires a mutex and calls sleeping I2C
functions:

drivers/leds/leds-menf21bmc.c:menf21bmc_led_set() {
    ...
	mutex_lock(&led_lock);
	led_val =3D i2c_smbus_read_byte_data(led->i2c_client,
					   BMC_CMD_LED_GET_SET);
    ...
}

If an atomic-context trigger like 'timer' or 'heartbeat' is selected for th=
is
LED via sysfs, the LED core could call this non-blocking hook from an atomic
context, which can crash the system.

>  		leds[i].i2c_client =3D i2c_client;
>  		ret =3D devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
> -		if (ret < 0) {
> -			dev_err(&pdev->dev, "failed to register LED device\n");
> -			return ret;
> -		}
> +		if (ret < 0)
> +			return dev_err_probe(&pdev->dev, ret, "failed to register LED device\=
n");
>  	}
>  	dev_info(&pdev->dev, "MEN 140F21P00 BMC LED device enabled\n");
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725081349.8556=
-1-arun07172003@gmail.com?part=3D3
