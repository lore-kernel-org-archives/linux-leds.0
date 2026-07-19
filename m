Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DCA35975
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481186; cv=none; b=kZ0VbvroLd4Kv0Hc5MXSRZ9oShuEAaPdAH5VwLeWCmXMywVy8tC2fEKs8MXnVgiPfTxpyXnw7W+HN0kgxT0wCoRHI/JUFjFRB+O8jDzutnqqNyv8uKGIEdVZ79olAYuvJhrYrTYMof6rdxbuq02K/4xAAyXvn9MdqSIuH5+W+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481186; c=relaxed/simple;
	bh=+1k/lGYzQlYe3doiXWqR3/XbhKwIgfEUnnISBQQGoSE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HLZ7GWnCSuoGN8V11bAE6fp03eX0GnBrlmbRQuLsKdaj5zj/ofWxDJZX2atxT3tDRwmNliqqabtULUqiQhiA92H/4VphqK275wwfZdu3HfKLP5jWZzNhr50eFnUdjH4CvsfZeZfTG8E4xJuRwoyNmPGvyZrBvsXNiJWbg0/0gZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dI+slKeD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI+slKeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2609D1F000E9;
	Sun, 19 Jul 2026 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481183;
	bh=+1k/lGYzQlYe3doiXWqR3/XbhKwIgfEUnnISBQQGoSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dI+slKeDBz6RK+jLF1NPHZeSfIwU9FQql6vTren99EFVB23fkdM/TdRsDpblH6Hmo
	 pI+VjAPpry+t4nN0Rj1Y+RZIe8vtftk8I7FsMzDyeghksg6qhUoTS6QAJxVk5Z+Ns+
	 JPTTbRJFKd77vmy4HSEiREd9xKjKSy+Dpqc8t1CJfbBC4SxJKTrvgN4d0msBBxNlM8
	 gYdZZFaYO88iwWMSVtHql6N1UQCPWLDDnWnXqZlPJ8BNzwusU6AnAQrFzTzz/142KC
	 RZXbLprd5+k5PKJPr+2tkUQ15uqIp/q52DYjPd1OGNCuhHlShW1MP70HBazjhoOUcS
	 /LScSJ/bcehzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 04/11] leds: cros_ec: trigger: Implement
 offloaded() callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-4-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-4-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:02 +0000
Message-Id: <20260719171303.2609D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description violates the LED subsystem capitaliz=
ation and prefix guidelines.
--

--- Patch [4]: [PATCH RFC v3 04/11] leds: cros_ec: trigger: Implement offlo=
aded() callback ---
commit 0bac1c63d12afa93687a92119005931f3bd9f550
Author: Rong Zhang <i@rong.moe>

leds: cros_ec: trigger: Implement offloaded() callback

This commit implements the offloaded() callback for the chromeos-auto
private hardware control trigger. The callback always returns true to
reflect that it stays in hardware control.

> leds: cros_ec: trigger: Implement offloaded() callback

[Severity: Low]
This isn't a bug, but the commit message subject does not follow the LED
subsystem capitalization and prefix guidelines. The standard format requires
the description after the subsystem and driver prefix to be capitalized.

Could the subject be adjusted to something like "leds: cros_ec: Implement
offloaded() trigger callback" to align with the standard format?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D4
