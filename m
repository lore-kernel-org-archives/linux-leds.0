Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E65D46D097
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871026; cv=none; b=XufgWd6l3ix4KszneAbdIq3jMyY6QY9joXMMHQrc+62ZV9/jEK89Uvd+Ox3vLl0yECLacCjoCkq6e2pmDwaLPLKZasCpJ1Iv2IzUp6KOM1dZIttYqi3RwMu8HPmpqRbW1k5ppTPY6SZwPlLSKmwoU3LGd+sLzYQUOTFjnmOe4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871026; c=relaxed/simple;
	bh=iMWjeConLLM5jQ8K/1mTi8jiwyJgFHPVhwvU+OuuGNg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=awPEi/66TWIFVxFgKLy2KtZFOSdPR9ZMfeoBpwg98nbOkllkpOqp6K++gUP3UA2Stt8V4aDxvmwb5l5iu09AUx5GNz4Kz6jMxJqHBZF/26YVNYK9I2trP6ZVFl0vY2uyez3rKL82avuaoI1XJeeigYf096eOEl277v9VSoJESxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Obe0LkXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Obe0LkXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1275D1F000FF;
	Tue, 13 Oct 2026 05:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791871025;
	bh=iMWjeConLLM5jQ8K/1mTi8jiwyJgFHPVhwvU+OuuGNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Obe0LkXwEsJIKafm5uCOUTLIX5IXH3b4WZSwUfvZUyfG3kBM/gwn3H4bIGyEo3nOO
	 XtTSFThpx705+YeO72/OsdIknTIZbOSqNAMqc1j95uzmsZ/aDY/Q9nGGek2L3aqXe3
	 41MqFMIfEc+ReF/IG6I/YYI2JhYRQNxhRP2i8EPUJ91TP9w9HGkfW30rvK/+lliDs0
	 qLTcdxxzHBpbFui6x3JiElqoFjQ/fUzFvgk5yAeSodnjou0pUyhoU/aDDMfWIapxVE
	 u2EjRtm7kMZ4a/EeJdAvPbUrwdH72A2ak0TFa5+wdL3iZNku3gCXZVcD37gNLu9qjH
	 D4fzDRjuAM5mw==
Message-ID: <sashiko-outbox-169023@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] leds: aw2013: Move assignment of chip->num_leds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-4-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-4-cab1fdd050b6@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:57:04 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> devm_led_classdev_register_ext() executes default triggers
> synchronously, which call aw20xx_brightness_set().
> aw20xx_chip_in_use() silently returns false, skipping chip enablement and
> causing unbalanced regulator disables while probe is still running.
>=20
> Increment chip->num_leds inside the loop, so that each call gets the
> correct value for it's default trigger.
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-aw2013-aw2=
0xx-rename-v3-0-cab1fdd050b6@postmarketos.org?part=3D4

