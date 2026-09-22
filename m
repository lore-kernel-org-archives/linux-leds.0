Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE2B3F4DCF;
	Tue, 22 Sep 2026 05:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790053571; cv=none; b=j2gAJ08lMdO1UQObn6y7DR7RieFMPXBDV08PRNC7n+x7CCOjhH/biEu0dFuGh82CnYdjTLSKqyzNpt7j6NLmROVkcy4shECLO2nc2ZXEDLmaD8ylQyuGm3AL0RbmYyUhF1mbEklhfTHLslgk8hz6/lV/3FtgCzRyS0zwtibitYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790053571; c=relaxed/simple;
	bh=pto1pzn7ER7qe/qTVsZdX6D7aPIhS9k86YPm8EaoCZ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JHGM+TpQTaA4AcS+D8Zy2q7gSmZiAQsEzYYKcMIzHZyHQuKUwJqwCPZ2W13eGGemZC0gesbCp4kEbxsxXn4d6O/B/AebGlO+SxPZ2WRmk3VtDTMU1EZBaXEAoz4TojjZIC37X5bqTBwpJFxJQo+uFz2pMAO9+f9S3OV8mQ32IfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os6AYpPJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os6AYpPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5328E1F000FF;
	Tue, 22 Sep 2026 05:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790053569;
	bh=DE81kLCXN97mIqNNbS/66Wje86cIrs5NvVnRz6uzBfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=os6AYpPJB4R7imREcpfosLYycIdpKPKuN3cW6fSpYWY86FNOBnxz3/J/w31tw/HM0
	 rgHjmXkHS2La7CxoGF/uNECvFF1HfDIO2DPcXJW29BHcGyBe3DuLUxekIiQIf9DhLs
	 q+7oPRKz8gGukn4G6ZvK49HI36AvFR9JW0E7CXOYKPwRu3Z159UAn208ro0sKxqAr6
	 EkKd2+z6I2jPdMPrrLUeoQ96mCd7lxea1ABgqncsJxAH5PmaQaNIPiJhvW7BCYGg8R
	 VtU6VfopVr3ppkhKIjjukeO8qgVj6EQ+7fXNcrDw0qVQ4SeLk3xJEZXUpwRVFxMaUe
	 1k1RwkbFxddYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Convert leds-lt3593.txt to yaml
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: "dongsheng liu" <2509730023@qq.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <tencent_67B8796B733C275D1EF565D0D2CDB9B48306@qq.com>
References: <tencent_67B8796B733C275D1EF565D0D2CDB9B48306@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 05:06:08 +0000
Message-Id: <20260922050609.5328E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Convert binding doc leds-lt3593.txt to yaml format, so that nodes using
> the "lltc,lt3593" compatible are no longer reported by dtbs_check as:
>=20
>   failed to match any schema with compatible: ['lltc,lt3593']
>=20
> Additional change:
> - reference common.yaml for the LED sub-node properties.
> - require the sub-node, matching the driver's check for exactly one child.
>=20
> The schema was written with the help of an LLM coding assistant, based on
> the previous binding text and drivers/leds/leds-lt3593.c. It is validated
> with make dt_binding_check, and against the "lltc,lt3593" node in
> arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts.
>=20
> Assisted-by: LLM dtschema yamllint
> Signed-off-by: dongsheng liu <2509730023@qq.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_67B8796B733=
C275D1EF565D0D2CDB9B48306@qq.com?part=3D1

