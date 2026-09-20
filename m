Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD0C4582DF
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934259; cv=none; b=VOC3e5Eh2Mry8r0rbyTRQ7EgG+637s4Kf/KES4OoCdIRpqR5q+NaxgaGzhqmU9sxlQAyMP+0mpoR5yLmBJrF63SQ28VJj+iV3WN5nd3KAxkISyPZbmMRYsaRMBUhDyDrlLl2psfLeAqH8hLTCcGGs778fRJeO7iWoxYcFwbth0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934259; c=relaxed/simple;
	bh=tIRCVuuQz8OOsRu8BaLjKCDm7Zr3YQB7tdeKs16FEUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dHHW2lscR75wE4skHn9vwrezZoZhFJ/O084KNeaUDHmLXTf9Uk1DHMYmPeRBW7o6OuM43ikIr+D3hF3VawWr/qW60tXbLf18ibi+tK0gsZfLb5fkgsUU9m/7FPrZr/NQvZRrecwa2nW2CRd7GtzA9dzxf5WVX1hyDl9VHu8K6S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIwAYiyS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIwAYiyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5B71F00893;
	Sun, 20 Sep 2026 19:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934258;
	bh=tIRCVuuQz8OOsRu8BaLjKCDm7Zr3YQB7tdeKs16FEUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bIwAYiySQo7MueQmrquAAy/VLMD1IAdaKKyX5x1H7F7WEP/6Za499TqJmihtSA7ua
	 oMBXAwfHvPI3j8G7gbEfOvakCTs6OL1ZMIrs3Tqu4xJFFmMpzH6PQ6slmGiVUEXFqW
	 z7jTrQnrjBbz/TpBide4sRGCHPcs6YTRqIxrWYdj07NoBH6ds+xuWm1PFLXwRBi4TP
	 G06WwnlJlzd+MtFHK1gBhZoF88KHjtXdALv5gQonUgen8HsCWvo7NLGtDm3H8cek5n
	 p2FwMjj5yyeBapksfQcy11QirIV7AH1NLToyuIVoSI+XGaqDycxLnk1EjM3LO0LbjP
	 tGLn8r3jKwFbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/13] leds: trigger: Move
 led_trigger_is_hw_controlled() to the right place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-2-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-2-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:38 +0000
Message-Id: <20260920195738.5F5B71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Currently led_trigger_is_hw_controlled() is placed at led-class.c, which
> is not an right place as it falls into the triggers namespace and does
> triggers stuff.
>=20
> Move it into led-triggers.c, and split it into locked and unlocked
> variant for convenience.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D2

