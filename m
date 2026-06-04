Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900424657D8;
	Thu,  4 Jun 2026 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583869; cv=none; b=SQ9SvwzVVOeV4j0jJ7gWvCwkO2akSbFmiBl2khEwl94LdwZ7aMvGS3wcZ34z+MEWlNKQVb2wQtaG6Oa9WHRKCnXOujeVteDs/zIjIGMDRHdKoYl75v0hhHGewOirAyUaXBCtpQJ7IB5kzhhr/Nvru5l+vb3noQjLZxoLURm08qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583869; c=relaxed/simple;
	bh=+HMa/juRjEph66e+l9jx8gZX39UzzOgATc34XlZHpvQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jePD46Qde5ZSz6B3zVKoyGjzZvhZHNKFmg1Shm/6gjYwc7jA7zGkujYvSJkjBa8OqdQZcRvcDv3lwRHo28Jg2y5n729Q55VpqG8NuINIVfAOe6hjCCph5rk2ixf8m5fL12d5kJfwZ2VsCXqugGDBB9JCbPFu0uB+buW+ohy/uTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/8TOUJ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/8TOUJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E3C1F00898;
	Thu,  4 Jun 2026 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583868;
	bh=oapD75nniXimjWwYwNEEdqGGrV/k7/qAO5GNe+z3/go=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=e/8TOUJ07cNkVFn+yZTPyAGlFBRfzyaSfWGFQwd3P0eEe38ARDVoihgGe6k2lySAp
	 dioyRJrN1/f5G9HNjzP1zDjS3/JBj0m4/wUkyR1XNM8bVLso5d1C9NKMDYS/PbdNGW
	 IdpdO6EuN/osvHUXMQEIb1WI0i4lMAKmf5oElNSfljdKxZNeru+o/9J3JraZWT71dh
	 7k4uUYdvZEFBMczf+RDcqiA6EZdFmxzk6FrxgcZ/S+7pFPa0aKkjReOLlPnPWDkkRH
	 ToTtilf6ql8LlYSvNo0Fgr8bu8U1anOTcVHHnb8D+qblpwbK28Dcv+9VKhPTA67fjs
	 prrq6ARup0vkQ==
Date: Thu, 04 Jun 2026 09:37:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>, 
 kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <20260604-multicolor-default-v1-1-b07bff431537@pengutronix.de>
References: <20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de>
 <20260604-multicolor-default-v1-1-b07bff431537@pengutronix.de>
Message-Id: <178058386626.470860.7786918322035913068.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add default-intensity property


On Thu, 04 Jun 2026 13:06:57 +0200, Jonas Rebmann wrote:
> Document the default-intensity property to set a default color on
> multicolor LEDs.
> 
> Update pwm-multicolor to support it and update the example to turn the
> LED red on boot.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml             | 10 ++++++++++
>  .../devicetree/bindings/leds/leds-pwm-multicolor.yaml          |  4 ++++
>  2 files changed, 14 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.example.dtb: led-controller (pwm-leds-multicolor): multi-led:led-red: 'linux,default-intensity' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-pwm-multicolor.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260604-multicolor-default-v1-1-b07bff431537@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

