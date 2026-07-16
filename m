Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5033334C1C;
	Thu, 16 Jul 2026 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215433; cv=none; b=qn/HJPcx+NDtPYhMonoBwlE2HpQyTAib0KW3P2VXVOchnQP1M5/6dGfvwm80ALajaamvCHIpNLE4YYvmMlAgFW/PgVMApaLe9OMpZg5DNmS/w4n4sBQPDbjYhIOPQMXK6u4vFwHq94XVUBnv3A3fSu/mh7YT84qm95OwQTAScrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215433; c=relaxed/simple;
	bh=AHpBzprPU26lf1cCZpf9lYXkw36fznuHWhig3DbL8vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYg2wjDydZCkebJAhyGwJFV8me9CcU4keJ3Fber93dKaZTmZlQlwZ58TO+lABpXTkdAQb6e1Ql4z5lPHngFeEZ5vX2CJEr87KK1jG8QOXNy4UKW8EFaNbVZPtsRG5k67MhXqngyzkhdTatIlfgft5mwxAo2/c6hlfuREJiQ5NRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JmaZWR6f; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JmaZWR6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1784215422; x=1784820222; i=wahrenst@gmx.net;
	bh=9wCYpt1xk2WUG1wKZenNQHiB31tKPm7qcOz72g6xF7Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JmaZWR6frdlGd5ZqJjmp+WYNFpH2dOcueeDDyr45nYsdxTIXNi2/8pa0JVAV37kn
	 X23QsTIc9zzJJp0Xe43yd+2qPWkbfDSKBR+xF4+yJZ6HPEjBJ/EmmvXkPZv+oXWBw
	 DzDYCeGkpJ4X5+DajjhcpiwekoX1yELnPt2JR4iwP2ajop/4k+BMd8kS1X1yBTToj
	 pFV49GVgzyLNwl26O2XqlYcwPb8myH3egqAO8l0hQ5Ebasq2WUb37jEVhS9tNsndz
	 QEHJ9+JxGwVY5iD2ogwpeS74cDIkBFBQRRf+e13L0qj05qTQMdwyLQW1z+L/I8Z48
	 KXwg02z6SaoR2evYhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0FxV-1wzHJq3jHT-0106xI; Thu, 16
 Jul 2026 17:23:41 +0200
Message-ID: <388a8914-2563-419b-9038-8985605638ed@gmx.net>
Date: Thu, 16 Jul 2026 17:23:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: leds: Add default-intensity property
To: Jonas Rebmann <jre@pengutronix.de>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Conor Dooley <conor.dooley@microchip.com>
References: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9wHRIdi7lOofQCqnM9gKdjs1s9ud++RTc3gZ/miBmznjJv6DWd2
 B4oqej4nuX7vhqJ/AuVHezayy3sesC6KCQmpY/u7hmNaVrEEdMSPt5dxgQteGHIfU7nZZss
 revq5EHKtq6EWFRlrNvpN5Nw8ARPa5k8aDl+PqYBe/QLWtkIz5pLuYptoJruuIYUFROdFKI
 xB2dO83KchsTfgReaBvnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uKbD/abREzI=;4nVOxADIttfhqm2NbQVDQCHabTl
 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
 AS3jhKU1HaJIY3CRO3KR8

Am 14.07.26 um 09:35 schrieb Jonas Rebmann:
> Document the default-intensity property to set a default color on
> multicolor LEDs.
>
> Update pwm-multicolor to support it and update the example to turn the
> LED red on boot.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
> Changes in v4:
> - Move default to leds-pwm-multicolor.yaml as other drivers have other
>    defaults (Thanks, Conor)
> - Move definition of default-intensity property next to default-brightness
> - Slighly improve description
> - Link to v3: https://patch.msgid.link/20260630-multicolor-default-v3-1-24c5170ca3cd@pengutronix.de
>
> Changes in v3:
> - make default-intensity property description more generic and less
>    redundant (Thanks, Conor)
> - Drop applied patch that introduces the property (Thanks, Lee)
> - Link to v2: https://patch.msgid.link/20260605-multicolor-default-v2-0-ed07271df6b0@pengutronix.de
>
> Changes in v2:
> - dt-bindings: Use correct property name in example
> - dt-bindings: Add missing word in property description
> - Link to v1: https://patch.msgid.link/20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de
> ---
>   Documentation/devicetree/bindings/leds/common.yaml              | 9 +++++++++
>   Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml | 5 +++++
>   2 files changed, 14 insertions(+)
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
