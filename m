Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701850391C;
	Tue, 13 Oct 2026 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913297; cv=none; b=YFlR38XBQZxhT9oX+SSvlRswWFKxRT8N7vKb8O2llAkCVVa1Dca5SB401evhJZ32vID5E4EGjQV6idBov7W0k6Bj2vMqOTVO8Q03/a5jA/zwV3h1FFUsKDsQKE+x3rFUE3UzwqWkOcA2paHSUlgcP9uiJYFh/tpRHjJqyQS1gXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913297; c=relaxed/simple;
	bh=NO6ECDV9chyUxV+UaUwEtLtiA3XAN32EvCoB2s/4O5w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BEV+5CDCrwRxV+2VGxX/pzrF8X6G5LWRQEUuQqXnYhcwBSPl8XC0uywFVNVOy06GwnhufX/fEPyJaWefPNXfcs2vUCCUoL6zzshMRMdvcqIvzfHyOHyPGlX2zEYFSbv03amJxTzNyW8elY/lbvdAPnlarneU2xa5tCODqe0p4MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLWMLHwo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLWMLHwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051D91F000FF;
	Tue, 13 Oct 2026 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913296;
	bh=NO6ECDV9chyUxV+UaUwEtLtiA3XAN32EvCoB2s/4O5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLWMLHwo9qB/0+LWJUAWQ+WiHV9zuy5ea33vzD9zmZvOeWFaGoYCQmuPUHarMCuCB
	 QD+MVoqNd2xgZtAHZRg2D2Rh/+gtVGbko0ER56iIk+jh8BtpGZa2QG/a3K1dZbZDVj
	 dFtXmHEqy8oXSYCYzHM0joB6/Nasrj33fHUk7ivT6p5je0FiAwpl0XY9ehGVBs6Hme
	 +WbxugjbF8COuUxHlqX9yqTRiIi4XRUSkv2VdJyp2ElZ9CEWuJxUMxhx6oqonZw+Pq
	 mQovt4NDCl2NaE4bKLvjBYiFfW0MteciyLZ2bRfoYLLTVzRCwjM84gvXAuhFoqH5sK
	 N53N9zqEpSDIw==
Message-ID: <sashiko-outbox-170243@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/7] input: keyboard: Add driver for ASUS
 Transformer dock multimedia keys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013173504.451391-5-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
 <20261013173504.451391-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:41:35 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Only Dock keyboard input events are tracked for AltGr pressing.
>=20
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013173504.4513=
91-1-clamor95@gmail.com?part=3D4

