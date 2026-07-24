Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE44483AB;
	Fri, 24 Jul 2026 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913311; cv=none; b=BXUP8tHCx9/AHSiYWAfNW4/4KnZD8nrw5UK9vLlRyPhFId/aGy6k5QIZEtVrOnzWvoJB67FfNFToroDKuF2bWOP8dxmsx8PNTr/Dao+4p6t+RwexVK6dp/APnzy3TOVUsicrUkxiDYJVVSF/9FtSZILx4Ksi6jnDHKTNZuO6beE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913311; c=relaxed/simple;
	bh=xeU1sRZ56uozc/E0s3PCCaxPvwQXpVONM8U2UynDcOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g9jLIqtM0HpT1WEiy2dk3C5NqaV0nr0/GlQLsLJR15ytHcXdP49RyZqFLJAkZ+vmVAXvbGWK0VFfMGISTz2D01XNT22o8ezKFq83GYIsMINgkIxkegP0Mtuall9DWC70teRVc4jtpVG8dTKeNsThg3J5ywPTnLe9ts8iZIHsEug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmlrFXJe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmlrFXJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBA31F000E9;
	Fri, 24 Jul 2026 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784913309;
	bh=xeU1sRZ56uozc/E0s3PCCaxPvwQXpVONM8U2UynDcOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cmlrFXJehJB7PY2M/zaA7pfLUhTQq1aARGFQGYEYW3gvlJYhqEmuMXiJ0EyIdfIEb
	 UGCyqM23A2eNamGgZdtthZ0lov4vRV8+t1dXHnPv2qjdJwZQG6Vl14Ejl5RC0ciyil
	 JpDiyHY7DxmEx2E/7SSExw8BMiw+Q2LyKlRvGwBHxXq9B7locLsfjK0zhJl2pT93Ke
	 bl6UUA6ofa47ZPN1FdiZ9jJxUU6o0F0MlL1+tZLolZL3mBtuBDz3qJDUiaL9AQTxuo
	 b3hQ4GrQhwdAKxqHAMpVqUqeNf876vC8SQmS9+AmXw6kXnHuMN18CGGf0OJxrCYap2
	 Mthh/+yubfjwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260724-synology_microp_initial-v18-1-fb2f49f10e77@posteo.de>
References: <20260724-synology_microp_initial-v18-0-fb2f49f10e77@posteo.de>
 <20260724-synology_microp_initial-v18-1-fb2f49f10e77@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 17:15:08 +0000
Message-Id: <20260724171509.6BBA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add the Synology Microp devicetree bindings. Those devices are
> microcontrollers found on Synology NAS devices. They are connected to a
> serial port on the host device.
>=20
> Those devices are used to control certain LEDs, fan speeds, a beeper, to
> handle buttons, fan failures and to properly shutdown and reboot the
> device.
>=20
> The device has a different feature set depending on the Synology NAS
> model, like having different number of fans, buttons and leds. Depending
> on the architecture of the model, they also need a different system
> shutdown behaviour.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synology_m=
icrop_initial-v18-0-fb2f49f10e77@posteo.de?part=3D1

