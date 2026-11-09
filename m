Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251605;
	b=1yFdgi9P46IRAnDU5Cf9263hA9RWO1CtLFtzZXYFzfCPndka7zJAbTeeRvGSjDXeI42s
	 QGhhlQu/6Qa0FIBBS0XyRjhDhXQqAM0juFeuMfUX5Buf5QFMOAufMXk3h47q+55nmHGNX
	 5PL6ASnkyphrPKLQUrOl9ldN1Tk7hKT0TkM66GRRbndWraUQMYefDm4DO6VwHvTq2A7zQ
	 73rgef63Wmfzfl1t5QxAgXVOhJq+Xu3yWavODn5GWMR5DaO6J5MC2KcLwffzPIygc4po4
	 6xaf9gwjWozKq4Arl8NP9P/ZAMBw1DFsZDV87Ivkgv3mBkWh0+kBqttKOD2WnhY3lkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251605;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FPll5l6OaWVQSmN0qJ0nyWorlky1jdGh4r5MM9zOAro=;
	b=yEgYvhyBZ1lIMjTNld5dJ4Mt2jOEs/QWLQ2l3FAQmf2CF5rWR9tGLssUu2zwceDJawcU
	 efWW8KM+71R0lRBBpD8FMSv52Afk5EF3foa9niB8PrDT+3EVmVuwKitUVwNHWLFwhs8q4
	 8VK0e81upd4qg49PY7/bzNV+8Xqo3X8VW7suU++0QMCi6aRMLVfscqUz97Gx6aSKCFpTc
	 /YStTl8+IPSkgk9x8odQHQQCx+PbUoGOONfrK5Ju4/GCxOsL4aYTYQfIVzacu0gIB8V4Z
	 ptLbmiqIAdYgja+i/MFMK2upL5O4ltepKMBg4su+ldf8tbZaocKOGgwmnsQ80TiKPFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ariknf/i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76994606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ariknf/i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38EA1F0089F;
	Mon,  9 Nov 2026 19:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251605;
	bh=FPll5l6OaWVQSmN0qJ0nyWorlky1jdGh4r5MM9zOAro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ariknf/iNEvsTZMUVs4PlfswLaZmn8X8nsCP3KOs63hrc3PpsMD8y1MZwl8QIh3zI
	 5VQ0TOmHUB5DhG1hpCSI6EM62Mo3DcbRT1X5pH3PgYRWEH1pXbwPbWrgiwwZndYJGX
	 F+sZ1+rjdvoBzmwRf6uuMnzcNetpa6k0kFlzO0yxnbjY/ZtgwBAJ8Em6Iowx6DZNOu
	 UWeN3N7JinLA7WPAogxZdTLBGdVU9l4a9Y/nNyN0NWqGbU4mVq/NHpcZKLlFjQQWef
	 FWmlQqYmt/WkPczb36tHf8D4yV3nkFBOLI5sZ+SOH1qrA6+vbldiBR1hIEFfmnw+GY
	 oLwCsv9r4dWvQ==
Message-ID: <sashiko-outbox-205467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] leds: rgb: ktd202x: Fail the probe when the
 chip does not answer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-10-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-10-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:13:24 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The driver never reads from the chip: the register cache starts from the
> defaults. So with a wrong address, or no chip at all, the LEDs get
> registered anyway, and every later write fails.
>=20
> The reset write can't tell: the KTD202x does not ACK the byte that
> resets it, and its data sheet says to ignore that. So once the reset
> is done, put the chip to sleep, as ktd202x_chip_disable() does, and
> fail the probe when that write fails.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D10

