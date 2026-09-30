Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D23FA5EF
	for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751550; cv=none; b=Zex0B2iiZERFsqESOahaIe3ckkUHRuys+/BMl80yDANE5MP3LEzMQ22ylZojB3nM1083I7MGyKBtzyq2sp+yv64k7UL44Cbb/+GzTBNy3NRFxXjskiGa/PF8W4grH8q3uEmYIc3q6VadcGz8C/PbujpfzYMh40FBCQTLy+92XX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751550; c=relaxed/simple;
	bh=9S3uKXMOOEG8vwDxgbhxERyvO3mXl7j1FsGRXkq5KP0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nIphiQ72fWPmTKT6ybn1tFp9uFf9RXGija5QuRZIDHgKIlxeMPiycSXee32KgSLQHXS40FI9QtEezrGMbkiD5LyiKpTbUPRZiXvq77rh773NtdnU10Yfv0KK1btRBKXd3be3yE63w2thlM2dfvICIfzkzY6gc5mgx7wBvtoZmWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/gF7WNe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/gF7WNe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0B11F000FF;
	Wed, 30 Sep 2026 06:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790751539;
	bh=9S3uKXMOOEG8vwDxgbhxERyvO3mXl7j1FsGRXkq5KP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b/gF7WNesV2t/RjhaLAxDp1QHnOpx65uploUjkRoueI90bTlaZ/ZD3pxITsAHEY8v
	 je7+UgHSwP389lhWDT/QP3P8iyG/rfMlUsFgdjv1iI4ktpoMt7dK1wSwg8iCwD69RS
	 z0c7ZBCZ3ML+iZre2ahRx9y/5eCHWzYVG8S+91HPYaGoDswiczQRrHutvLRrr6Iya9
	 ZL3a42LxLqZ0Y+eZWplMq1gUzuok+h1Fkpc1hpqcPRoUFPu6QB4xkghV04zM/s9nTQ
	 Ryilp+zFGPDnqYFsM/a6MAcUf+d1ZDO0tSlgOf6R6jQlkazi/TfsqOYtWydiyXpNk0
	 0P/2VIrKGkRAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] leds: triggers: Add led_trigger_walk_leds()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolay Plastinin" <plaztininikolai@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260930-leds-input-events-brightness-v2-1-3948d3cddd83@gmail.com>
References: <20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com>
 <20260930-leds-input-events-brightness-v2-1-3948d3cddd83@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:58:58 +0000
Message-Id: <20260930065858.BE0B11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Nikolay Plastinin <plaztininikolai@gmail.com>
>=20
> led_trigger_event() sets one brightness for all LEDs using a trigger.
> A trigger which restores a different brightness per LED, such as the
> input-events trigger turning keyboard backlights back on at the level
> the user picked, needs to walk the trigger's LEDs itself. That means
> using trig->led_cdevs and led_cdev->trig_list outside the LED core.
>=20
> Add led_trigger_walk_leds(), which calls a function for each LED
> using the trigger under rcu_read_lock(), the same way led_trigger_event()
> does, so that such triggers do not have to walk the list themselves.
>=20
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-leds-input=
-events-brightness-v2-0-3948d3cddd83@gmail.com?part=3D1

