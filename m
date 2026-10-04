Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8453C7685;
	Sun,  4 Oct 2026 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132658; cv=none; b=CF4rsDpFjXVu9NThCsN2dt7McQeKQsKxoASRTfN2bule+rQgQ12RU6dSP+jK7Z6G6BFSuzFtmx9yiDj7tC0XaTJ/QyP+uP6C/nej0yswCF+n/zckqJushxHo2GHQFtDdbhfRsIWfxRJ5jNKAZAkRaypUuFdV8QudznoZ791H1U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132658; c=relaxed/simple;
	bh=JXSPLFHFWp41xF4FlvC4+Wtb0mQxXkCErio9PDsMkfk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EV0b0bZvocwYFclNH2OU7js6t354zF9p3kKge39qoxS59Fd2hRe9Lhrx3xjtmAU0BoGthAJWnve4NcusXXHs2VSoj/kYsFTFPMQOpEpQT2DzJ9IdRhH3CBymQDdxUP26+60hsloCcJU5hU341O7nV4ZgiTQhV0cK8vRArvaiNkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOfzX0q0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOfzX0q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DE01F00898;
	Sun,  4 Oct 2026 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791132657;
	bh=5AdhvBZtdreGBBfmpt7FZcqlh2Deh824eypm0xyIOvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IOfzX0q0fXUn9Sc5DYV52XXzTIAESBsA09hUyPpXTE2HuFjdVdpB9hr+5jlynu1tp
	 AtpDcUAAR5m/HoiDqC2frk7sF1VjZzjkkNdAp62BLaSmZks0xlTxe4ypn+mVwbd6Uu
	 pqpx/XaYgNG25y/W6OB2Ef0CpEfHiyyASvTS2sueJpniV6zEMK7+Sl/P889hIT1Nd3
	 RFz09EusddKAdf808WYmCeJ/EZnFAx5eqroa78V7j8ze/TLmsfleTJyBfzh3HQ63aB
	 gVd2JWVQTfRPi+x3NosarB3x9ltj/TqI6UgP2QmLilBH7f/2/XzKFHOygeFjjG32ie
	 5YM7Mho9bJVuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: Document Skyworks AAT2870
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261004164121.193514-2-clamor95@gmail.com>
References: <20261004164121.193514-1-clamor95@gmail.com>
 <20261004164121.193514-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 16:50:56 +0000
Message-Id: <20261004165056.86DE01F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing `type: object` constraints for child nodes
--

commit 44544968b5bc5130f1768962ce3f85c8bc12cfad
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: mfd: Document Skyworks AAT2870

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml=
 b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> new file mode 100644
> index 0000000000000..014678616076f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
[ ... ]
> +  vin-supply:
> +    description: Regulator providing power to the "IN" pin.
> +
> +  backlight:
> +    $ref: /schemas/leds/backlight/common.yaml#
> +    unevaluatedProperties: false

[Severity: Low]
Does this node definition need an explicit type: object?

Since this backlight property references /schemas/leds/backlight/common.yam=
l#
which does not define type: object at its root, the dt_binding_check schema
validation tool will fail with a type is missing error when checking this
new schema. In dt-schema, properties representing child nodes must explicit=
ly
declare type: object if it is not inherited from a $ref.

[ ... ]
> +    patternProperties:
> +      "^(ldo-(a|b|c|d))$":
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false

[Severity: Low]
Similarly, do these regulator subnodes matching ldo-[a-d] require a
type: object constraint?

Like the backlight node above, the referenced external schema
(/schemas/regulator/regulator.yaml#) does not inherently provide type: obje=
ct,
which will also result in validation failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004164121.1935=
14-1-clamor95@gmail.com?part=3D1
