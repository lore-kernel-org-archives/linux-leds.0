Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFB448F848
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476949; cv=none; b=vC1mk/KODbp+AwjIsbBLj4dxDPkAGIDzuUL1qVNXnwUI1mdGw0JL7Al057qgPGsIQphqldNIHqzUSokzXv+mHqSHW91F+tgxrFNl9SPDYZapM0tpG4gQSkVUyP34VujHUyl0883wxb8BBc3/CEngevNCnb/SANwpw3X9LwB27OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476949; c=relaxed/simple;
	bh=JPeFN6YtzgQ51TQ8JE2PqKuL5rGfJq7mBQNhcTt4mU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C2/pwLeEtceGx+yKTPnWZKZN5814UysS5AkpkaSMEn5FDA8MZpxMnEZt6IQ+4a7lpjcOQ279QkhYy/vGh5zFADSbol9XqcnpgCT+dgquedUH9qxQavig47m+z89us9rDGnQ2qTKYTywoy8zEIX3FRZ44D/VkJZN4yis56GVDLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blyaVVT8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blyaVVT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D211F00898;
	Tue, 15 Sep 2026 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476946;
	bh=JPeFN6YtzgQ51TQ8JE2PqKuL5rGfJq7mBQNhcTt4mU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=blyaVVT8UCkLbvC7N7ZHassGnNV+KPkrtkbnouR1Oi8f3iJGj6kOarOwIKi28IKoX
	 btW/7tBmRMUy4zn7AlviHmYi1cO/1hYNb/gYiUEgkzphz1GMzG58p5JhoOK1zvOpjt
	 GBHJkhEoAuqrSKi9upaIaLuHIJ6Riu3ENJpY6KfhrrOib2XvL6F+XAyRD4Zd8XMBPv
	 trHIaZT1CSNH17k30DBNQePbE4aZPnYB8KxSc2ZMJNkyXInMcFt2Ym7eO8drGx+xSb
	 fp4S5G5OnLgGCG/1xTBKxt9jNXjKVtpWKXzZk1oc/wJG3twNjhCmKEy3ScxH5J1h5I
	 HJttkn1V4Yovw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/13] leds: st1202: Take a reference on the LED
 firmware node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB849710C564F23C21BDA3EA41C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849710C564F23C21BDA3EA41C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:55:45 +0000
Message-Id: <20260915125545.C3D211F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> st1202_dt_init() stores each LED's firmware node while walking the
> device tree with for_each_available_child_of_node_scoped(), which drops
> its reference to the node at the end of every iteration. The LED class
> stores the pointer with device_set_node() and does not take a reference
> of its own, so nothing keeps the node alive for as long as the LED
> device uses it. That has been the case since the driver was added, when
> the LED class devices were registered inside that same loop.
>=20
> Commit c72e455b89f2 ("leds: leds-st1202: Fix NULL pointer access on race
> condition") moved the registration into a separate loop in
> st1202_probe(), which also leaves the stored pointer unreferenced
> between the two loops.
>=20
> With CONFIG_OF_DYNAMIC the node can be freed while it is still in use,
> leaving led->fwnode and the LED device's firmware node dangling.
>=20
> Take a reference when the node is stored and release it through a devm
> action. The action is registered before the LED class devices are, so it
> runs after they have been unregistered.
>=20
> Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D8

