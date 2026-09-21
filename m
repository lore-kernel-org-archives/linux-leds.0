Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F38342510
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984793; cv=none; b=cWJxVMTe8W5iHLa0MCW01F+DaCqZsvnDR6HoXn0xeJ8L+WGrJoySSV5NlKkS8K9ADRerkPg7ZQJNd70svm6Z4uyspiCsBoZEZMdJiH6YyytX+A2TJv1Q5bk7OC1lD+CBqjvHao//EUkl5YnGI4W6S5G3l32i56sBkPSk9fuFBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984793; c=relaxed/simple;
	bh=dDM/Z/eosPmPJ9Ewy//G9c+wSPvab69MhqmYirSLfaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FkCR0VdTyO0uFOrYVBnYs80jWL6OLGQO2ql93TMav1h8Nl73nSUpHGQjZc+SgzXRfRfUpNOD+Ta+YOI9vjdBFUIvb0Qc678Ti6cTG8DSfmtK0OMAtLAy6SrOW0ig3YSx96VCBGr8cxZVZ//cKy63kHgfckx8AWjCmiMHCYiBNHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCfrWpoH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCfrWpoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F09B1F000FF;
	Mon, 21 Sep 2026 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984792;
	bh=EuXBGxvN19mkdmC78HjWnH3Y/yqFZiVAlcYZvj78REc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YCfrWpoH16qSA/g7l3Jtth0xzFq/rNAWfTSuyzwOW6Ao4ccajzDeuKM0z9JrBEK3d
	 RqZDnEVj4pwBfwRMYY2EBU5+Vu6LZU/zrCZGDD2QAevr+JtIMIT9rv84RcAjFpvLou
	 Icr+7hZnP/CQxKvt4PwyZLkypF5KvlhBOlJDpRLw/iGEUo+SREjH0TBnmvsgbyNaav
	 J9/eb0S4+dtQs7/KQb5OUOINRb0qGEpbcw66AnlxYppSX/I0JLbQYrl99ktq/SxAxD
	 chfmQptSwiozG0+7H38pxzsyifvQPmAxtrqK1ngGJ6AoLgC5+0/xgvdLcnjIfDnAwj
	 FbB6xv9yzBB3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] leds: trigger: netdev: Access net_dev under
 trigger_data->lock in the worker
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260921093249.3481413-3-alexander.sverdlin@siemens.com>
References: <20260921093249.3481413-1-alexander.sverdlin@siemens.com>
 <20260921093249.3481413-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:59:51 +0000
Message-Id: <20260921095952.4F09B1F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921093249.3481=
413-1-alexander.sverdlin@siemens.com?part=3D2

