Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC34F49B1EA
	for <linux-leds@vger.kernel.org>; Fri,  9 Oct 2026 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538167; cv=none; b=L4kEYSmRj6rcTVNbpQV7n5f1VwRVByR2GW2KPUXkl8aSaI1Hy1/LO1xLjtwrlutQDqQjaQzwAh3BOeiT2s9Oyqti7ALmz7WwxwHXahZNSkBzNvGoH10oQHY9G5NbthFXIByRRmff90+bzItefipnzecH2SEEFbZvJLtjWZXLQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538167; c=relaxed/simple;
	bh=6t0gN+E6FFQO2r6YZjryc3Umfn19jmUm+fNxtZF16jQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MVfGYn1E78/WHC5p1a1RG27jGHK3/XuCo91pEV2zyZIHAhGCrQM9gpadYma78ONc/gt5yoqeLd3P2CgqUf4jIdwn/GPNzfw5T3uX7qzXUtZSD6Sos3KMGd3wIWR//cAEicyZHl7bqCFtBh2mSi3L8XEbSCKrdh0na3sbqi9oXSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEz9FBUE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEz9FBUE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692F11F00893;
	Fri,  9 Oct 2026 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538166;
	bh=6t0gN+E6FFQO2r6YZjryc3Umfn19jmUm+fNxtZF16jQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dEz9FBUE3+SUNIXQbFYiqZ9SOT6lMx1z96EIPS2vYLtt2KbVFPfnbfS9QcLobPcyO
	 jrh5QmUadaYlTtudUuGj9DIwMPh1xyasmy/VG7dnfPbEZ+yrGPMdGl2ADcmdJenwrs
	 iJ8RFIMqeL6aQz2IimUnSYhWPTPejRs7zpMQWj4t8ET3QVpYmPGZbXgS4CVny3NNLS
	 3K3+5/yU43zEp7dI7oOa2yai/NnN+kfML/dNjUryvjQ/rHonhKTY1McLFnyS/D/2DX
	 H2F6fHz6w8SlSWQQDeMsm+9QM0LfrJ1svlYBRcaLZF9rtggapQOHcVBVSR49OpTSbe
	 Vu/85lZzIgNQA==
Message-ID: <sashiko-outbox-165168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] leds: lm3532: Avoid duplicate error messages
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261009091059.25729-2-phucduc.bui@gmail.com>
References: <20261009091059.25729-1-phucduc.bui@gmail.com>
 <20261009091059.25729-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:29:25 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Most error paths in lm3532_parse_node() already log errors. Add an
> error message for the devm_add_action() failure and remove the
> redundant error message from lm3532_probe() to avoid duplicate logs.
>=20
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009091059.2572=
9-1-phucduc.bui@gmail.com?part=3D2

