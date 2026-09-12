Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0B344DB5
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253226; cv=none; b=IEM5sVy7J3O9Ocb2KWDmcUFQHgL8K4+3MJikrUKG7RYF7mdZlpIggm7lWFDQUNUfNqwDwvu5+LsDBYRW45DzAN/RXAkAgqdRH6kuaSpfaBerp1bdbthToYMwd0ya0VDtasEQg/e5vEVB9Na9qk4j1ivqR0z64vkIvCdfHhO7QVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253226; c=relaxed/simple;
	bh=/yzupWQvb/UNfBJIisv88uVxs6EkDps+/fV/WJmxx3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Maz317McFN8iVzWxfwKG1vHtbyRuVKNrSSvisPhuIzoENDKGR4OCrsR9gbfeLYfYphcseGAzP0VVMcHEgF3UYbNkD2UsFe8XJeAmV5UQ+dy3jWSO6wMyspLi2UOc8D2xe21MjVlYXObVGSVZvyog/jzfBViiIBa8Mrjb3LFPaW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIH0WX+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIH0WX+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653021F00893;
	Sat, 12 Sep 2026 22:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253224;
	bh=/yzupWQvb/UNfBJIisv88uVxs6EkDps+/fV/WJmxx3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XIH0WX+P/DbQ1XgbLQIHmqY5IPO3yNUtGQaXaMhXlndteXJvKLk4KtzsrheTM2D2l
	 IUSrK29ANcnMSsed3vGM2dvsZt07oE0OkAcQLUjujVvuK6+02ri2bMACufikknp9zO
	 UfrsFpWM0vvLYkGidm/OEZ09npogBnV9NB9TKVSH3/2zmgpaVTadF+gN/77F2Jfcvj
	 ISpIVE2cTnERkAxY53rQzlgGK0L6U4JYnzH0Q40WWW2P/DNMAGBjHKCMAog3VavG4c
	 TNboFnV0eVMFQte88aQNy5bjNOroGWwiwoFKLFx2HdFM4lvKpdEoP0ShXnHsz8efiS
	 sR7sRma4lckMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 08/11] leds: st1202: Take a reference on the LED
 firmware node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497816399DB42627D7F9D61C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497816399DB42627D7F9D61C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:47:04 +0000
Message-Id: <20260912224704.653021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> st1202_dt_init() stores each LED's firmware node while walking the
> device tree with for_each_available_child_of_node_scoped(), which drops
> its reference to the node at the end of every iteration. The stored
> pointer is not used until st1202_probe() registers the LED class devices
> in a separate loop, by which point the driver holds no reference to the
> node at all.
>=20
> With CONFIG_OF_DYNAMIC the node can be freed in between, leaving
> led->fwnode dangling and causing a use-after-free when it is handed to
> devm_led_classdev_register_ext(). The LED class stores the pointer with
> device_set_node() and does not take a reference of its own, so the node
> has to stay alive for as long as the LED device does.
>=20
> Take a reference when the node is stored and release it through a devm
> action. The action is registered before the LED class devices are, so it
> runs after they have been unregistered.
>=20
> Fixes: c72e455b89f2 ("leds: leds-st1202: Fix NULL pointer access on race =
condition")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D8

