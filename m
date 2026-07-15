Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03447311973;
	Wed, 15 Jul 2026 16:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134513; cv=none; b=qarfFYJVHqoArRmECoNI2AYp8YD9LN2gGHA3egGGVotKbBTwDxC8BQ9KNThRIkB1ixbVHCZMIZuBHJBqIke/bIa1F8uK55PILDDizmHrtKiPZwIC1SpTxdta1gUR7yqjJEkvnkFCpuvBJ2b0lZJSieN66aUjlQ/1+dMIehVd9Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134513; c=relaxed/simple;
	bh=dn+gjvfQO2nO2xqJvpN5/pFLzPA7+kxR+iX85tybCpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnfanrcGy+W8uyHQiPE0w+VgfMWBAn5+GnoQdobTHNyD+bEqpDrjza9v4tlse3SyOIPfjVN4HYb67Sda5hapK1+zOlhWVaWbQmSM6GlJYhlJhbqLKT9i5PIls1h+M8XN5CYilzrm/0bjrX72iSyQS70u2V9WybFjMkiVcriv1bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=B02NEpfS; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="B02NEpfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1784134508; x=1784739308; i=wahrenst@gmx.net;
	bh=a776hsPj0eQ3rLr2YBKokUIN613/EruYMKgYPpWuZR4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B02NEpfSHessO+g74hXRqQ/k8xqNeRtnvYVUbTLPFEqwCyC/3AVjBcCYWPQc8J3q
	 7AG/6Rc+lTg+/RauU7MVrNv3ytNiBAE0nscCkiiLwF0tjRXy1biR6yIdi5FxNMtKR
	 Ru6p5Uoe/7KCKJRyY1QHHIiOrXMdarSN8OSsgN0HpNliEcbqhksi5sZ0DN7f2b6ZI
	 HDztbWxsNaCC7LV9Iy8qx66Ds+GB//BZ1oTVzZQ4fLCfWoECoICk4UDWsg28zvTxX
	 7Nr6dwWS0QysjrYaGw4kbVWCxRctVYHei1b9wPm0hUfcAQkv00q0/pA+foGn9rTAk
	 mSEW8UQcTOYfVeET9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMuR-1wNp2j24gb-00SRCR; Wed, 15
 Jul 2026 18:55:08 +0200
Message-ID: <1a458220-daa9-42a2-8a68-7281afc82eb4@gmx.net>
Date: Wed, 15 Jul 2026 18:55:07 +0200
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
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V6hqGIHastqQ84APCrA2guwlMRx+Vv3BraH4P1o/0kH7E61zhmo
 aq8igw5TblBeR4UlpjYf73F1gJUEl7cwq+eMTZvV/RgVcrKGBacR++UuUv1uoRiZ/muECf0
 l3KTiIpAPbN9MoQz245xiDfeB0LlzedMzfX6660fMjjKZTg1oxsVSTvYLTolYVOCXBOpvrK
 Xc3cczpLtnZFfqINX4AJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZQCgX83ZSgk=;+sv3VQKbb9gF4Tfj0C/usaY6txg
 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
 =

Hi Jonas,

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
> - Move definition of default-intensity property next to default-brightne=
ss
> - Slighly improve description
> - Link to v3: https://patch.msgid.link/20260630-multicolor-default-v3-1-=
24c5170ca3cd@pengutronix.de
>
> Changes in v3:
> - make default-intensity property description more generic and less
>    redundant (Thanks, Conor)
> - Drop applied patch that introduces the property (Thanks, Lee)
> - Link to v2: https://patch.msgid.link/20260605-multicolor-default-v2-0-=
ed07271df6b0@pengutronix.de
>
> Changes in v2:
> - dt-bindings: Use correct property name in example
> - dt-bindings: Add missing word in property description
> - Link to v1: https://patch.msgid.link/20260604-multicolor-default-v1-0-=
b07bff431537@pengutronix.de
> ---
>   Documentation/devicetree/bindings/leds/common.yaml              | 9 ++=
+++++++
>   Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml | 5 ++=
+++
>   2 files changed, 14 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Docume=
ntation/devicetree/bindings/leds/common.yaml
> index f4e44b33f56d..3e6f913070b0 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -179,6 +179,15 @@ properties:
>         initialization. If the option is not set then max brightness is =
used.
>       $ref: /schemas/types.yaml#/definitions/uint32
>  =20
> +  default-intensity:
> +    description:
> +      The initial intensity of the LED color component. As the intensit=
y of
> +      each sub-LED is multiplied by the overall brightness, without thi=
s
> +      property on a sub-LED, it may effectively be initialized at a bri=
ghtness
> +      of 0 regardless of its linux,default-trigger and default-brightne=
ss
> +      properties.
I have some reservations about the wording. It isn't wrong, but in my=20
view, it isn't entirely clear that the initial value depends on the=20
implementation.

Maybe something like this?

without this property on a sub-LED, the initial intensity value depends=20
on the implementation regardless of its linux,default-trigger and=20
default-brightness properties.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>     panic-indicator:
>       description:
>         This property specifies that the LED should be used, if at all p=
ossible,
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.=
yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
> index a31a202afe5c..08e28c5f08a8 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
> @@ -45,6 +45,9 @@ properties:
>  =20
>             color: true
>  =20
> +          default-intensity:
> +            default: 0
> +
>           required:
>             - pwms
>             - color
> @@ -63,12 +66,14 @@ examples:
>  =20
>           multi-led {
>               color =3D <LED_COLOR_ID_RGB>;
> +            linux,default-trigger =3D "default-on";
>               function =3D LED_FUNCTION_INDICATOR;
>               max-brightness =3D <65535>;
>  =20
>               led-red {
>                   pwms =3D <&pwm1 0 1000000>;
>                   color =3D <LED_COLOR_ID_RED>;
> +                default-intensity =3D <65535>;
>               };
>  =20
>               led-green {
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260604-multicolor-default-11e3becde05a
>
> Best regards,
> --
> Jonas Rebmann <jre@pengutronix.de>
>

