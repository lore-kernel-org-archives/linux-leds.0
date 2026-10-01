Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3FE48F03B
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860831; cv=none; b=G+aISQMCEPyO5bIZpsoJ5Lb41NUJneSPTk8fw7pa/6la4a4mQqIY9TdhMz0D51jdEa5KI2NrNiqJktCg9R42uEahXXZA63HXKGnFKiY8peE6ckOSQgLlJuU+4azebh8lSP5qTEFSGy31K/2FjnZ2eGMGp1sGhO8YNXRpOtpn9q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860831; c=relaxed/simple;
	bh=AXjBhYgeu0kWUyZy4L9pNxGXD+KuPc4oxO1hNHY0WyE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eUHGs+a9XcoiLuIKGWN3BemyUwUFtjl4nnPFzGugmC7QgV8eGZ6lkLe4n+CPNJ6B4PVqHymrYT7pm0G7SvH9EXs/OT7p3DMMlhhJqIuY/KVjAlJyvYhMH3bAOLcbcOj0KfiaA7XXjoIB0yXqTkL9/JKCeDix4otuEWflqBMHXWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfF2wFDQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfF2wFDQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90351F000FF;
	Thu,  1 Oct 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790860829;
	bh=EcxW7EXOF9r60wbRPhq3vowegp2z9yaMRSN247D62ZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BfF2wFDQW419E+tBob0Bcp5LyH6dSmAsodPXLmxj1i7jQl5BMJTusjSjxi6+zRv/F
	 xO6Qa/c+SUpE/xI+I3TJf+tvAFewKh3YEGUHqEcPm8HR9V9iTZlhrbc1o9Ka6Nbm2h
	 lfiA/gOk2BYd8T3w8VOqfzK0aHfbvZXeoLQOAaRSPKewODgGCldjf27Ch9o25M4DS6
	 /NHMCwLO6DYYC3nYRN6I2NaMIYl2WzaXmXDJpg/5yAecS2xL079xQNHTipLfDIeMu6
	 oYgwymulbWdvE6fc6RNEhBFaTURpdGKADn5XAuXzZu8c74v6YViFxJo5RxKHowA/0P
	 Rbn+cuKGhBkTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] leds: trigger: netdev: Access net_dev under
 trigger_data->lock in the worker
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261001131206.2513248-3-alexander.sverdlin@siemens.com>
References: <20261001131206.2513248-1-alexander.sverdlin@siemens.com>
 <20261001131206.2513248-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:20:29 +0000
Message-Id: <20261001132029.B90351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> netdev_trig_work() dereferences trigger_data->net_dev without the lock,
> while set_device_name() and netdev_trig_notify() dev_put() and replace it
> under trigger_data->lock.  On NETDEV_UNREGISTER the worker can run
> dev_get_stats() on a netdev being freed (UAF).
>=20
> Take trigger_data->lock in the worker.  cancel_delayed_work_sync() must
> then never run under that lock.
>=20
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/20260914142116.6DAC51F000FF@smtp.kern=
el.org/
> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001131206.2513=
248-1-alexander.sverdlin@siemens.com?part=3D2

