Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135040E8F9;
	Mon, 29 Jun 2026 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743212; cv=none; b=aUWvsmhCu1ZJm5vHcISW0/1yg5+sQ/R7Y4ZJBBK/i4SeWB51zWiGdK6Qbk2uJx3Fj1LDFOz87IWeGLfMV+wPoujsGB7okcLrL6u2gBfBq5VHIqoBKT6pzoICOhhYVx0YegXJCKvh/lh4nEWG3yIAjyKAqFgOLhZQzhJRY0ToM/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743212; c=relaxed/simple;
	bh=0ZGPGDqvR6ru4wG9H7sosL++I80VBP7D+P7fKmPN3G4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bYoRi+sS4oCtGy4shqZxqGBhJny9EX6DgOnTURw7bmozG+bzyBtE8kd57CzjQcLFMnd5InY6lPXsG6ErHYNzYd960kMV5dssA+usLW8l4j5/eGPp8snUltcf55kEHSDb2eqahNvZtUZYIc1welN2x1bSQFo6NyOSx7F1wABoIQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GljNOyEk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GljNOyEk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FE61F000E9;
	Mon, 29 Jun 2026 14:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782743210;
	bh=4+MrLttHs1xHjqL7zCcXr/yNFRuseFLIDD/fQZuPFp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GljNOyEkSqsLvktGQ3KdtY3QIaNKZQEIJkI2tXIzHAPB1NIu5y88Nv8kXfA21aOqi
	 CFl8JNhF2k3XqriqRrvDptkp+thMHCLXBw6bflVLNFHmGng5gkKsLCu993kGs2/MYX
	 t2OJV7p0X+FBL2C5mE/O/Of+P18CQJl+skeIxjfAxHGG/jxm3d2jlRHdwWbsCrJA+3
	 rFR4zDlhtxMgDS4EuqBm6mbNJ/oReASuUvry+7h+XLf3h8/HYdyD9WeC4ezbqAYZVv
	 qdCFrHpItvAuM9iW6anqaOUjpeFjXWPaD19P8Dalk9jcug1Z2G1Rtsj9FiWjywFpsT
	 /dcBQaTQMlxuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, ojeda@kernel.org
In-Reply-To: <20260629-synology_microp_initial-v15-1-4b3d7367c7cf@posteo.de>
References: <20260629-synology_microp_initial-v15-0-4b3d7367c7cf@posteo.de>
 <20260629-synology_microp_initial-v15-1-4b3d7367c7cf@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 14:26:49 +0000
Message-Id: <20260629142650.29FE61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string `synology,ds1221rpp-microp` is a typo for `sy=
nology,rs1221rpp-microp`.
--

commit 227a0e75c964c535a574ba2e91904deade287d1d
Author: Markus Probst <markus.probst@posteo.de>

dt-bindings: embedded-controller: Add synology microp devices

This commit adds the devicetree bindings for the Synology Microp
microcontroller. It documents the serial-connected controller used
for power, fan, and LED management across various Synology NAS models.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/synolo=
gy,ds918p-microp.yaml b/Documentation/devicetree/bindings/embedded-controll=
er/synology,ds918p-microp.yaml
> new file mode 100644
> index 0000000000000..eb1c9d3fac074
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds91=
8p-microp.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - synology,ds1221rpp-microp

[Severity: Low]
Does this compatible string introduce an ABI regression due to a typo?

Synology hardware models with Redundant Power (RP+) are RackStations (RS),
not DiskStations (DS).

Should this compatible string in the properties.compatible enum be renamed
to synology,rs1221rpp-microp before it becomes a permanent part of the
kernel ABI?

> +              - synology,rs822p-microp
> +              - synology,rs422p-microp
> +          - const: synology,rs1221p-microp

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-synology_m=
icrop_initial-v15-0-4b3d7367c7cf@posteo.de?part=3D1
