Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9989493635;
	Mon, 19 Oct 2026 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404514; cv=none; b=k7FD8XLDoDLwyukm+hSUnJw07NOnFR9NEBcEs7LiDHb8jJg2V1cfK5jYOiTuVRk1ipM+Fl0MGbT9k/Fzf+eoYToBj3dKhHX3j5WIdYnyFrMqaV7/uX/A8p+zcZh5OnsuFeywpcHl2bq23QzXNtbVj7+4ikqobMsKOT3kSQwZMZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404514; c=relaxed/simple;
	bh=fSZaYE7NmmMWMbIXqmH59+fq1oIG8tsbORqwpDhMc4w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pJ4L1H+nZpl7E1+cph69Wlj4PllpNpXavwNKgW+yGz94EzHprLEA8Lpucc7n0cxkTbgEUS811nEYpovyBkt6bdMqr1T0r19Ey3MZtr+XRCJ8sIc5R26VV5Qf/aFWiJGzPGh7HoQXJe0JsmAi9WcKf+FeRQJz2WzhwRm5gQlL6Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFP5kNnG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFP5kNnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A931F000C4;
	Mon, 19 Oct 2026 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404513;
	bh=fSZaYE7NmmMWMbIXqmH59+fq1oIG8tsbORqwpDhMc4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JFP5kNnGhJSYU5M1DbDDpSCVlVRJ5pl5tH3OdXfLfs2il8ukhYexFFHfvly6LX+KD
	 rwLS/WR8ZJpCGKFqqgXchaPKJ2yuNeMYvZT3KwA8QXElJbd3T05YNEnVA6syM4R2x0
	 33hLLTJjHBL8UmjEWDIJCNayYvnyjXknlL9/YTVHivfk7ovSOtvrkBG/zb3DticWr5
	 pC9+oUkKh/0gHWOcJRohSxj6Mb73pq/E7LvsH+lKenidrbQ3yzV6WCrZs47ZLq0q4c
	 hOXeGkMJdMksCWH2Z4oFGa/fnyL4QFEryHaWjPwxowN4lcfGFOwE2XIYwvEQhLXHxN
	 Qgs4TScdG+iQg==
Message-ID: <sashiko-outbox-176950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 7/7] power: supply: Add charger driver for Asus
 Transformers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261019100406.103687-8-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:08:32 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Add support for charger detection capabilities found in the embedded
> controller of ASUS Transformer devices.
>=20
> Suggested-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Suggested-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100406.1036=
87-1-clamor95@gmail.com?part=3D7

