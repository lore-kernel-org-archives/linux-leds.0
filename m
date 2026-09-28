Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C7048F035;
	Mon, 28 Sep 2026 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594623; cv=none; b=LsZMkPhygZtNLxEEA/GSlnpwXaL/2ZuAabJZNdZ0wxoOA9OnUDpI1H2mMn2YT03Q8GJW1P35+5tHfvwtqHyz7rgkfBjc4qvrXO5xCMXOG8MX0tjpAEf0rXpJeEkY6LSZY9Z+J4Ne8eZRNq9y5xv3IBqZ4wYTAB+KxkBzSe5ee9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594623; c=relaxed/simple;
	bh=i7qegoM/NmMM6qkc45znAlaWtJjruB3B5a8COp9sBog=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rEkQhRrKsskicwh9sVy/JGej//U9bICLbaJtrK/ife32q41AHuJSjE/LqitBL4kpCHRbGZ1TLC2IHeJNZpphCYZrO0vUIYKDGOtHP9EzWWdkCulXbK30Rg/prPKeLKCn79u5QTOzz37UfnjNB7/m1jwE6mUCmHs51yZ86AxxBmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZK+Okoks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZK+Okoks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4471F00893;
	Mon, 28 Sep 2026 11:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790594622;
	bh=i7qegoM/NmMM6qkc45znAlaWtJjruB3B5a8COp9sBog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZK+OkoksnrQbYmpgJHNzWuhZqiuIZp3TG1G9YdLBRSo1Zxrtxgy/oignJFnxAab2H
	 XHy2R7rZdWi8UA1fFP+raP6lZqxshtbffXXPmrkkuOJC4Qz7GhYjzSRReNT9FEvFDl
	 kDTRP/U7uE3CWq2ikNEf9JuetDez1ZlZaNl5AS8foY9eLmycYneR4Ino0G7FMs5EhZ
	 Kxy1FWU9zeA10rEdG96JPH8ndHwDYwGVOJzJjhrfpaXtGAAkETccGoqWOf1HKjBiTt
	 PNSmEYnybCiQD0RhOnztxqUzcFmiJv2kLc6rCOH0q8BQIXXc37+gUvIBiBBPA8vHRK
	 vlng9r6+Edc5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add CZ.NIC Turris 1.x LED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josef Schlehofer" <pepe.schlehofer@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928111907.72592-2-pepe.schlehofer@gmail.com>
References: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
 <20260928111907.72592-2-pepe.schlehofer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 11:23:41 +0000
Message-Id: <20260928112342.2B4471F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Pali Roh=C3=A1r <pali@kernel.org>
>=20
> Add a binding for the LED controller on the front panel of the CZ.NIC
> Turris 1.x routers. The LEDs are controlled by the firmware of the
> CZ.NIC CPLD, which is memory mapped on the local bus.
>=20
> The turris1x.dts device tree, which is part of the mainline kernel since
> v6.0, already references this compatible string.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> Cc: Marek Beh=C3=BAn <kabel@kernel.org>
> Co-developed-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928111907.7259=
2-1-pepe.schlehofer@gmail.com?part=3D1

