Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F63438BB
	for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684548; cv=none; b=QZk8JL+AGJlTa7+GLcTukt83HUS1ci6X++ermsl9+0UoMCUwfg/65wLdMsz4uI8KRDMm1LPsgI+fTKU1lqAHF1skzNcBUcbrHnEEg1Whc5YalTutTASfvCzdQyBJdvgnU/8wqNhmYkvSiFmWySS+QBSNqLOlaxJxuSrEEG2gXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684548; c=relaxed/simple;
	bh=MHgm9oPGqDpZATJ+P2rMuIdwAYxFWTfAJ93iELDntlU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G19qNdoFmXKBpfO0RAnAzF9v8mN5Am0gR34ZfRhM1SHuAlGof5lw0/CycXEICe+SOEueH8vtx7GrWoZE26+cvhu9hviOj1arGcPwXtYQFCKzDrU/SPsnMrLPZgbm5i9ypN5u39esIVMJF0lfL1oEsiIqd3fKWkBLM1gDVHXczOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aa/6c02p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aa/6c02p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C621F000FF;
	Tue, 29 Sep 2026 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790684546;
	bh=nnr+7wWmSa+XkbmozZhXKQYiUUmY5gftsYPUspz9dac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Aa/6c02pdEr/5TqvU8y+9nPry2fXFIwv9hhsKVqnJeeYHw5hFUk2S4l26xu2Xw1Hf
	 HVwgKGXO6PIdrb0NKMc2Fzjc/paqwsk5iytiNPpZfId8d/aIGcYvkCntssopxCRgV/
	 2UVag6y4w/bXZzhW3TKDGarIEsTu3/V4Vjhb5JwPPbhgPNVYk2YuaQyTvDtZgp7Jra
	 22JyFZt5ijG8ioUTMm7yp6e7BXc+xHYQfbaxEM+Cugp/aERNEUM25elaIdnDWMTYaF
	 yH8qEmg6tEssK20QMgOD3VYsK3wzeceow9gHKYBmyRCUcSopHkRSgHYHwa0KuYtYeo
	 AEthNXBAiKFYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] leds: trigger: netdev: Access net_dev under
 trigger_data->lock in the worker
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260929120902.2793138-3-alexander.sverdlin@siemens.com>
References: <20260929120902.2793138-1-alexander.sverdlin@siemens.com>
 <20260929120902.2793138-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 12:22:26 +0000
Message-Id: <20260929122226.A3C621F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929120902.2793=
138-1-alexander.sverdlin@siemens.com?part=3D2

