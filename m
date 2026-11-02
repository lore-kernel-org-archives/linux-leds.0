Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586024;
	b=w7XL4KmvU5ctTxo5giQRy0ouw3pn4IcvwAgex+rwJK92M2S7nMOUjG1qWYQ2aSFBpf26
	 foEni947d/h49zX02GUN7PV41QkN+AlWQa7KwzAOxn66UsqxRDmxZIZyw2frOB1Zff2eS
	 MBXzA35GE35f80OpYMUfsGOn0eJKZh1AMIvpfYVAqVcm7HjLRk/60SQcy+5GGaQPFDQ0L
	 sxdgBpi2lm9v+vozXpCfj8ULtX6psrF1SgPZZhg3scQMlaHdHkUEo4X1Fa9Z/P1mspgHf
	 wvvqRvANHh0fQsBxSVD1yhiX4IzaaA8bfCaSpTWgx3Y4P35AQOGJkLC1N5KKRcy2UGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bfT2gxZ7XFGBv+HMZiEhK19UBqm8lmhUFB4nW2ldsZ0=;
	b=GMTCT56YB0DNvvnhQIdfJNXmfnislUhxr/R8SHvVhQtLM/O5r0qFcHtG3jQMOvhjKTGL
	 l4Dvh+o6znpAt1jPoj04u5yh+XF29062n4UFHTRiKWbWtkEpjOwGh+lrxL1iDhzORpULN
	 0IPYeO/0fqHrVwT15F82uxL5DoA/DB4l1gTEtMKBQyDXd3PCC0uipsCmJlc5UiMcPdSlm
	 yI0YDiFMIYoFNlqHJ/x8tYqkTelQ/s8XlvWIkkaUhns1VfYRoSrzHHnGpSmJoQheylgLS
	 Yh9Sqf4MZtcvqdcIdjVLwi+VfJuGpC1rjhEjbbLguFTU1YdCB9OntdKr3FTXYphz7iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+whHHLC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320E6606A324
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 02:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+whHHLC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D996B1F00919;
	Mon,  2 Nov 2026 02:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586024;
	bh=bfT2gxZ7XFGBv+HMZiEhK19UBqm8lmhUFB4nW2ldsZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S+whHHLCoifhohtOkTFYBt/+/wGCMLyXHDr7wur79htyqDJZDTIaq/SYVxMBb+8Ki
	 huNDHskk8YTgnl8YzUFFL49sXziQTTn1dlM7xjq9znj6/A1y5Xd6FJO2F96Qp6x5vy
	 x4cF0YmFFqYSc7LavmKg/yxBa/ANz8tOGbAR50kbue+ggEdQRmmGC7NYu7+bmiUih6
	 8bMiS/gj+8XHrw9uwMnd2Wn508JdA9Ki2wzMENQA0hH8BmBRrEteEi1Cau1Pv81aW/
	 kFHTf3PY6G9w6jDFhpmAZQbDp49D9RbhO8NgOYHW3XuvkfK2VSSLFnKq/NmGEt4AIY
	 TJqdT2+qajMkQ==
Message-ID: <sashiko-outbox-192830@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] leds: rgb: ktd202x: Fix an out-of-bounds read
 with unused channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-2-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-2-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:20:23 +0000
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
> The LED array is allocated for the number of child nodes, but
> ktd202x_chip_in_use() walks it up to num_leds, the number of channels of
> the chip. With fewer LEDs in the device tree than channels, for example
> two LEDs on a KTD2026, it reads past the end of the allocation and the
> __counted_by() annotation hides that from the bounds checkers.
>=20
> Allocate one entry per channel.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D2

