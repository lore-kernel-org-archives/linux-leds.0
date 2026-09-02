Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257BA48F85D;
	Wed,  2 Sep 2026 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352765; cv=none; b=TaBB8VVYHDfThToz4JHlkPbhTZmsycfXfF2BMUJLV8itSTwTfxBOrSKU7qna7EEqCjQp9XL8OWo6suxvi2CYcRd9yNyQdSwJIZ7lADw+E+kgnTcqSy6egTHmnS0iYyCNo0z3BaKo+kQYPk3pnAbF/n+3Fap13/A7vKM8huSFx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352765; c=relaxed/simple;
	bh=oL2tX4NRzjE1ezunVxlzKkZhw/6J9KRjqAf6gG0Xzos=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uBBCLd4qt9S5RraJJ+wUF3G7rjOd0csXtyBtmd41lHoTC9ZVz9XaRdz86nWXbfbqh11RIXdR/0BxYhwGusR1Zs9tJ6Sp/dRIewtub1lqyQsouyhV85OG3w8QvBvJAMot5bMwjg7R2tSSGvieQgzzmtmZ2C6IlA4IKUnYDNyTHK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lv3/1tqn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lv3/1tqn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401C41F00A3A;
	Wed,  2 Sep 2026 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352761;
	bh=oL2tX4NRzjE1ezunVxlzKkZhw/6J9KRjqAf6gG0Xzos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lv3/1tqnjcBVcHBmrfLCTd2+y0DvqbwqKx7yaanO9yt48Ak2Jo8Ch0dE6qAC0SMt4
	 iSRcWX3pP8G/F8ie3gI/SICOKghu9smeb+OPh0BZiy/aRk4Z3DuspDmNC31ZeqoOfi
	 BwTuYtH2xjmqA0VzBL8XUi2eKHnOQrYS4bo4U+9zCkaMKX4YF/X5OUIKXgNqUh5/JU
	 vfUWd/al4drzE8eL70+3SJLw0RbcXdERU/CGI3Y8Al4YHUQX6fTs4OHl3v7Zze9HxO
	 7f87C87/MugWB2d/1Qs5dyTXyaTP06a4Lhb2PJB50aAKe2mn8P53araVH6zjsWwC/A
	 34+WYgUcS7IEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] leds: pca995x: do not use full on LED mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <bc5241a0728aa81050d987c26a4c02bdb05d6d20.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <bc5241a0728aa81050d987c26a4c02bdb05d6d20.1788350618.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:39:20 +0000
Message-Id: <20260902123921.401C41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized, violating subsys=
tem guidelines.
--

commit 01d1bfa03d0ba73721521c5728d8d5c69f3ae3cc
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

leds: pca995x: do not use full on LED mode

LEDs in full on mode are unaffected by group dimming. This commit avoids
using full on mode so that group dimming is applied consistently, altering
the brightness at maximum to use a 255/256 duty cycle.

> leds: pca995x: do not use full on LED mode

[Severity: Low]
This isn't a bug, but does this subject line miss the capitalization requir=
ed
by the LED subsystem guidelines? The convention requires the description af=
ter
the subsystem prefix to be capitalized.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d3600f99c77c31166f=
0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=3D6
