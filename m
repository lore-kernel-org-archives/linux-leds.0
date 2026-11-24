Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514726;
	b=gBggTi01jBvrBOq1iOq5ljIs1ecnACal1rI2DEV06YrLWdtJYMjWA7JAWyuhfHJ/qo16
	 89/egXQuqCTTn8fzG1eWvHdjXIbjyu4u0VTyIzExV8nzmRpaombur/E35jledsZSeHL/D
	 MSrQKGCvJiuWg3S++mVErmAXHGYAVSbJImKb/nOV+iF6sT/722I1Fzis859A95Dt2Aoaa
	 14VIs7sSS6LwFYXIlcF7GGJdEtp8BvpWuYDrNR82wm3tEWJ0JvNsWr3c2wfMpo/pphxJ2
	 8HiPL1Ljxi+CIhVIt3Sl1O/0HSiEaogMmrnuYrgT3lMfGqzKB3dm9bjZIy9pMmQWhBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514726;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Jby7dX3HANO8X01Sl8GlgwJCUCx4AbiKYuIJD8p1MUs=;
	b=FxrZJE3lMWksL2h1vjdwP+eopWbIxUKBXbFLtqwOJD/qC0v8RrQSFqR5OZk/Fs29764+
	 ms3kutxrN1rkkqVodMgdsRqFgAphoFlirdLmQ8bzVFAjY07OaE7XYaqwS37wAeBkPxhtO
	 gHkMou3Jwu6eNq9nz9ZdGDRRUnvRvGqzclvvFSPqIy8sWKyZ41pyA9igKp9SI/NBeopsa
	 n1NznYybunrNc0TRgEKDjS8mKqJcopwdAkLXgXqYKYJ/QQlS0K9G/IIi6W8gjzTCh2Uf3
	 bTfSZ/Q4DR5ntQfB//L20sjhureMUmVZt5kWDVvp4yKrv0f64xKnI5rlqmJcj9ZGZyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FuDivHcQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C7606A31E
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FuDivHcQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EEA1F000C6;
	Tue, 24 Nov 2026 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514725;
	bh=Jby7dX3HANO8X01Sl8GlgwJCUCx4AbiKYuIJD8p1MUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FuDivHcQkiATuzNOTGILeBnYWGKPKfRUUExJkQDeB73W5hX5xZQOiJ9+RLfQPEXv8
	 vnqV+52W/DiyU/Js5afejILtCE17rkTrk0B0FkcBRw5E9LnjsQUfXKNAHSJw9aKc/g
	 DJxnEPsVkqpZbvVzIKDsvvWhs0s11RS82R6szVNu78sQmLUw6kk0IYILL0vXO3zk9O
	 20hLef0rO+afi1OhYOsm6cQIt2NaakUhptfgG/3HgPKD7iORP17VhebqxU89Vul6v0
	 BJJqNeM0kITm95BsVKV/VIjLVZvIh6qucXdK00xu9R5NH6aeE9VFcdsf+DQbSmAPqa
	 XTP5/a9uwhrTg==
Message-ID: <sashiko-outbox-230911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] leds: flash: qcom-flash: fix the v4l2 flash release
 loops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261124095408.3842986-1-congnt264@gmail.com>
References: <20261124095408.3842986-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:05:25 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] leds: qcom-flash: use-after-free in qcom_flash_led_probe()
  [1]
--

commit 01b91774110dfcae9bec7d39022e0b10aec8e56b
Author: Cong Nguyen <congnt264@gmail.com>

leds: flash: qcom-flash: fix the v4l2 flash release loops

This commit fixes the v4l2_flash_release() loops in the probe error path
and remove callback to release indices from leds_count - 1 down to 0.

> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/le=
ds-qcom-flash.c
> index 4e62a210cf98d..1003ba060b423 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -953,8 +953,8 @@ static int qcom_flash_led_probe(struct platform_devic=
e *pdev)
> =20
>  	return regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_=
data->torch_clamp);
>  release:
> -	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->le=
ds_count)
> -		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
> +	while (flash_data->leds_count)
> +		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
>  	return rc;
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but does returning directly
when regmap_field_write() fails skip the release label and leave
flash_data->v4l2_flash[] subdevices registered [1]?  When probe
returns an error, devres frees the backing device-managed memory while V4L2
still holds pointers to the subdevices, leading to a use-after-free.

[1] https://sashiko.dev/#/bug/linux-e48f7fbe-dd94-4b3f-aff8-e1dc279dec37

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124095408.3842=
986-1-congnt264@gmail.com?part=3D1
