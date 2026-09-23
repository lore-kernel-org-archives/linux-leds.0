Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84C72D23A6;
	Wed, 23 Sep 2026 00:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123934; cv=none; b=da57f+0NKm/QQxjgcSglgYlr90y3/2xiht7WI4hCQZgT7vFYXYsiL7CIpt/ez0hVwjRQ6C4mVwLmivXYZgeL/f0TCy9RlyNzeyaTckQpuaT3q7+2WfqxUpGUPBs8DX6+hnb59tY+SWTT4RzYGTWBq9+VKXsGuBfHng+FYb6ziJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123934; c=relaxed/simple;
	bh=KuJHDYYUsvE9UmEwxBo5BQ4rm65WdvePdfCAr//Dhi8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tC6BLbP73hkYVcsTFyXYpWvwiSvS59bFbGYGkPJp9yozk5a9LP7yriaSXDtN5JVO+ORvkCLWyCuJsBLj9ZDNn/W+Q8OB/c8r9PNMwLTH/DQwClMDhyJm4oSA9aqq4Syw08m6RB7OJss101ElMSy8vJs7rqkNLU0cRUynGWxXspA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsyNXC7l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsyNXC7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288BF1F000FF;
	Wed, 23 Sep 2026 00:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790123933;
	bh=KuJHDYYUsvE9UmEwxBo5BQ4rm65WdvePdfCAr//Dhi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BsyNXC7lD0+LZyG4vICkudALI6qBfK8Ul6QSq2gLzKdfOA6S7S4XAGZhlljZfy8L1
	 HZATXYRhTgFhifE5c9QJWStBSU7XRzjNpPk4DC7q0sgIbsmLdV62DfFjlEe76joKz6
	 2zvl+2zl856O6xktz36z+oo67v0YyA4kpMTiR+zE5thA5gn6nzbLoxHjX+y4dJ2u5L
	 l5EHYZ7CH/1vC9fPmLevjL1ZoCAd2SaqZOjAJzWMShyauHV4Bb0/3gKOMMAUl0r216
	 hOSLpl+BYmF/Yh2fFIO8cQTEVogiG/LRI8CZBVJL61DytWLf/GBgiBxNopBkqWEQHw
	 5BzQffjf52pTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v13 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923003325.61722-3-jancarlo.roleda@analog.com>
References: <20260911-upstream-ltc3208-v12-0-9107f5f0a7b0@analog.com>
 <20260923003325.61722-1-jancarlo.roleda@analog.com>
 <20260923003325.61722-3-jancarlo.roleda@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 00:38:52 +0000
Message-Id: <20260923003853.288BF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Kernel driver implementation for LTC3208 Multidisplay LED Driver.
>=20
> The LTC3208 is a Multi-display LED driver, designed to control up to
> 7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN, BLUE),
> each configurable with its own current level that is equally set to its
> respective output current source pins for external LEDs.
>=20
> It is programmed via the I2C serial interface.
> MAIN and SUB support 8-bit current level resolution,
> while AUX, CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.
>=20
> The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
> channel current levels, or as its own independent AUX channel.
>=20
> The CAM LED channel is configured as 2 separate CAMHI and CAMLO register
> sub-channels, which current is selected via the CAMHL pin, or set to
> CAMHI register only via setting the S_CAMHILO bit high in register G (0x7=
).
>=20
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923003325.6172=
2-1-jancarlo.roleda@analog.com?part=3D2

