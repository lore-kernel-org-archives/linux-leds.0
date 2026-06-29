Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3D44D693;
	Mon, 29 Jun 2026 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752414; cv=none; b=H+g/3yAqStTkx+J3D0NnC3lqz4wSqKQlxmoDPJu9KPknw5Tn84Pfmb7t4ENZP0qT6rK91jRzyT8mvYmWBo7LYxDB5nBxNEHacmmpyDLzRk419NupzUXj+It6jf9pswq8rymRhdEL1er6/cnh9ZW48/WbC+qEifgJpEzQczYuQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752414; c=relaxed/simple;
	bh=nIVu4FftdbyDUrob9Y0IOZKonYxEZ4ojBjkWBJTuvao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OGWlYBUTIzd8+hja4zFsRYuT+wsW603qdhjY/rao9A7t3h3arApW+xcpZZhUlYAep1H+otKa9CHYfU4A8LMHyHW47YLrecO2XGxPf0ASZs2ENsbnN+08nOjHJrRJHWu/YnIlx0+UymB6WR31dB2ChqrDPxER6zEEJi47FrULjuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tuh19q+Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tuh19q+Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128C81F000E9;
	Mon, 29 Jun 2026 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782752413;
	bh=EiA32P8s+qrnqCsvzsdcNmk1nLIh06cZRZCQD9C2das=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tuh19q+Zxa/tDFTqqvh/r6YnvHUIwRonevKVqVHuPH04hTegRRjHqZhISYXTlAjrn
	 jBTPEa7HuyU3dKCcaAOadf8BvCXE2rJBxbaCnLIf/aFCde1mfi3ytTOk6uYRoHGt2k
	 BRRRFruTXfWVO+KuMkewTVHH20s0pZD4Bd19zACmwcU29ZVBCkXG9/zlgU2yi8EUHK
	 7aQ7hUTk7a7F4Y+vzzxg9LtPMdANaNC3s0YluP8wUBTLPHT1td9sqiHS9Fdv2kWjCY
	 FsJ5FfuM7af0WlRcTsycXUqVAyN2sOUJRV6GizpsKIPCXgNlIRBpiRj5YtxvKwD9LN
	 8ZZ6xCvlNf1Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, ojeda@kernel.org
In-Reply-To: <20260629-synology_microp_initial-v16-1-601e91c49e0d@posteo.de>
References: <20260629-synology_microp_initial-v16-0-601e91c49e0d@posteo.de>
 <20260629-synology_microp_initial-v16-1-601e91c49e0d@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 17:00:12 +0000
Message-Id: <20260629170013.128C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `fan-failure-gpios` conditional block matches the specific l=
eaf variant `synology,rs422p-microp` instead of its base fallback `synology=
,rs1221p-microp`, incorrectly forbidding the property for the rest of its h=
ardware family.
--

commit ec0576fc5f2c12ad557bf63ad742921b02b47295
Author: Markus Probst <markus.probst@posteo.de>

dt-bindings: embedded-controller: Add synology microp devices

This commit adds the devicetree bindings for Synology Microp microcontrolle=
rs
used in Synology NAS devices. These controllers handle LEDs, fans, beepers,
buttons, and shutdown/reboot behaviors.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/synolo=
gy,ds918p-microp.yaml b/Documentation/devicetree/bindings/embedded-controll=
er/synology,ds918p-microp.yaml
> new file mode 100644
> index 0000000000000..a441018843224
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds91=
8p-microp.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - synology,ds918p-microp
> +              - synology,rs422p-microp

[Severity: Medium]
Does this conditional correctly cover the rs1221p hardware family?

The compatible block defines synology,rs1221p-microp as the fallback for
synology,rs422p-microp, synology,rs822p-microp, and
synology,rs1221rpp-microp.=20

By matching against the specific leaf variant synology,rs422p-microp here
instead of the base fallback synology,rs1221p-microp, the else branch will
incorrectly forbid the fan-failure-gpios property for the rest of the
variants in this family, causing them to fail schema validation.

> +    then:
> +      required:
> +        - fan-failure-gpios
> +    else:
> +      properties:
> +        fan-failure-gpios: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-synology_m=
icrop_initial-v16-0-601e91c49e0d@posteo.de?part=3D1
