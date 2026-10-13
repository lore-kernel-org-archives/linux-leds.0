Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0163F3297;
	Tue, 13 Oct 2026 17:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913422; cv=none; b=L3arJh3bbWtJ4EXPsYcEPNkEYFLHI8bYHho9xf/EZkNCLnUgyf4xUbh2nErgr3e+7cxg1gye5uSYfcCuqhx7vxkonofX0mixWVUihJvE5uFuRUTbdikhwJk6vR5Z1e3+EEyrHL5yotbY65EJuLp44kMzoSqycHtcobaNo/X5+DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913422; c=relaxed/simple;
	bh=++4kP004VCqMZXVh+Yxoua68Ux+mqOKLTTxabSRKqcw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BC9g75Si9w435h2OWzfQXhWZXlNLDIGWWRXWmF3U8cEp6oirY2u5xFmOxe51wU5ELqWLNKcHxwezplgpYvxJGNVzsgjyedGsl6VbNR+W6qFGZlI5WXIik5e6dSbSNvV2B4SX5APX6ktyHA3xlvi1cs2jRUcFA24pzxLKc2APR3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoGaFJkx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoGaFJkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680761F00898;
	Tue, 13 Oct 2026 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913420;
	bh=++4kP004VCqMZXVh+Yxoua68Ux+mqOKLTTxabSRKqcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hoGaFJkxrcLLZKq5pmEH6NwG26IThkbVmjmzx4ZDjWKD6n9HrMlBkYUTpfuMcA0dV
	 AE+61flot6RFtD6M7iNP4emw4eREuG4isWW9XxR5uizAoyqnMk2hBlLQFvVBAIEHCa
	 Zr5hNlWHeS83uN7QBW+KUBMLtjfx6RJe46cDalhAPzI/P+OqtDBE4omxRLSbDH9jyg
	 I7IzLSgdSAxEN1vE0IrWGVOM2zNmljLnu120vmbpJUMV+DuOSxbya+i11hpcG76bLG
	 qrSaywvgcI5DGtdseZU8DMua8bL5kc06Cg5P1QIV/Wm09o/7dYZb+x75cHUTlpP8BH
	 4iwwTq/RpzRaw==
Message-ID: <sashiko-outbox-170253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 7/7] power: supply: Add charger driver for Asus
 Transformers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013173504.451391-8-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
 <20261013173504.451391-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:43:40 +0000
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

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013173504.4513=
91-1-clamor95@gmail.com?part=3D7

