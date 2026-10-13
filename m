Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8A52FE21;
	Tue, 13 Oct 2026 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913793; cv=none; b=dg16/Xrh0uyOTWVhYhUHM58dvzFNMVCKLCJ79FC41acbbvPdOPh+3CHvVQ/RUAg+JCQye0JCDH+5HFtF3u3pAPDciEfoO0AoItXxFXfoIyIoI/aUPTLoTa5B5+QTk3ofzWrAjzhqyzCLuGabZhaodXP842C8pgfKiuyeHjbTjyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913793; c=relaxed/simple;
	bh=UFtxQObQjIv5rptSTlhsIz/JwaE0ExuvEJb5WOQA2PQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Vo5DZXuAEQUUXF6xNrH9mo4liK0RKdX7qj+xqFeCRm9AZ3O0GYFvG40HiJGiQLMsBcBoJsAhNQh9EkRguJdIbgSiObpwKv0R6MELE+YysvO4sW2deZprnzAAf30/s4URu/2/OfqCiYqUU+sOe8T8qM2PrTIe4Ao60u3n33cVi7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h49ZJ+MO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h49ZJ+MO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE581F00893;
	Tue, 13 Oct 2026 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913791;
	bh=UFtxQObQjIv5rptSTlhsIz/JwaE0ExuvEJb5WOQA2PQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h49ZJ+MONq5t0DrIZvoQoNhZzmgD+uug9ymFp8srok+T95dL0dXytRv3DFjOP54NY
	 5PfEB8Md7TdhU7bKJkp+zjATru3tHj639YR9jRrjsDRc8t/zfaL7u+JiissikMJ0Fk
	 y6QCFyZRgB9Gffcsz+d++PzugMhTsA3P7fANxQvORBpeRO4hDd0nB5psIz3EUEE3cy
	 t0UExQ/SGQmAYykDd5uKG5BmEsz9fBQEf+qZ4lxhcLmu6ElUA699ZYQsT2gqFsLV5S
	 ltgR+xZQM3LBEmvvrfI4BQRtkXUqCYT+IO2sNxzvePNKiSVYGWk7S4wE46kqxFK7Go
	 4WhvKqnjTn87Q==
Message-ID: <sashiko-outbox-170270@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013173504.451391-4-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
 <20261013173504.451391-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:49:50 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Add input driver for ASUS Transformer dock keyboard and touchpad.
>=20
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
>=20
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013173504.4513=
91-1-clamor95@gmail.com?part=3D3

