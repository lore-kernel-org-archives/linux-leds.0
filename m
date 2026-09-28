Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC184A9D72;
	Mon, 28 Sep 2026 11:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595285; cv=none; b=TYCAiUFl1jnBdVgVy4LG3zxW1XCi+1LbYdGmD+rzDJ52O4DA5zUkHvam5kUpclLn6eftQopCwERLHSmQsHlOK91PRn4dcLIT0lFUroX5cSEnx+t/s6Wsqlcxi7SeDW1/Yi4Qst70FV8a5UgUiRGGjv08mZ03g4hOvAyS6ihSzxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595285; c=relaxed/simple;
	bh=VupmkDOCvjGjBxiQEvzvh46+0We84Og1+dioFk2Qejg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mKiUDDdUUQepaBjm4DhTaF+8F5YCesNcwacGYwYXGlG6q0NHTPfe8Ao/sdYcdC8JSt89MtgUJWZSxsREwf0n0ODL5e1Ed4orACBqySeWrUjUBznJ9SuK6WLsDwPwSpnDYs1m+t0zMaq6AvNXDmNuT2UD3LkXyYlUp3lWEznQ51w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuJehK7a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuJehK7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D381F00893;
	Mon, 28 Sep 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790595283;
	bh=VupmkDOCvjGjBxiQEvzvh46+0We84Og1+dioFk2Qejg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SuJehK7a2UpKnncVQUWTx35NCJAojjE41izqf4rvo/rLmqJKdci7U1OixpdmwAg00
	 s/jo8zkTp5oJQSQbQ0x055b45n2GneUIlmzx5ZhdtdA2ecJM30XRkFo9mY2YTtHreV
	 WfrlK5IzqdlytUglA37DOxXIIiy5iBhEekperISP92Ihjo0105YpdOOxf8+IhDB95H
	 7RTXh7eMwpkNIc5+zSwMrwfY35RPp/4h7W3TGhtPtakxU23g7K8tCS0rEPXacDIm8O
	 1KzCh6YWNCQKWlaP6GHehU7XXC2r0Z9VwSDZe5HQgNcpJmUDHIKJsfZ3/RitkzAczk
	 snoN7+YC3/NNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] leds: Add support for Turris 1.x LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josef Schlehofer" <pepe.schlehofer@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260928111907.72592-3-pepe.schlehofer@gmail.com>
References: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
 <20260928111907.72592-3-pepe.schlehofer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 11:34:43 +0000
Message-Id: <20260928113443.91D381F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: commit message prefix omits driver name
--

commit 70e4f9934d8651d406ba12c71793199adbcac17c
Author: Pali Roh=C3=A1r <pali@kernel.org>

leds: Add support for Turris 1.x LEDs

This commit adds a driver for the eight RGB LEDs on the front panel of the
CZ.NIC Turris 1.x routers. The LEDs use the multicolor LED class and can be
driven by hardware events via a private CPLD trigger.

> leds: Add support for Turris 1.x LEDs

[Severity: Low]
Does this commit message prefix omit the required driver name?=20

According to the LED subsystem naming conventions, the prefix format should
include the driver name before the capitalized description, for example:
"leds: <Driver>: <Capitalized description>".

Could this be updated to something like "leds: turris-1x: Add support for
Turris 1.x LEDs" to ensure consistent git history categorization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928111907.7259=
2-1-pepe.schlehofer@gmail.com?part=3D2
