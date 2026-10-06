Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5AE36A36B
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283554; cv=none; b=ptDKlNlYOmOeSqChPY6r3INFn0GWdAPy/KYPZUWmHOSG9fRVwVVgVlIgZo8rRrm2b763u4LT++/5puHFx49aUEFpjDBgibL7iuhOvi/WncFTOGq0V3aCVlhjuNxDttB5KxnUVH0hMv+tcHFEzzmq9CiT6AER91LHmVoIMa2OzuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283554; c=relaxed/simple;
	bh=hYnMIuf9IJ9ZXwf35KrcykFHtQwQCLcRpmeWfFT/tXo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PwEGbMrmJeB2aYSPljQDW09DBHR+0HPLnviulMn/ra1xltRN7W7qo81SE4TYpOS4dby9+NDFH0vtzlcmRTAAUTiKKax+ObUaq2gbOY4DfBn6hf/hfBpg5nDROGCN8XbHOpxegl4Z6p8jSkUynvaMZFGiWj+3OK403NBXKzbv0aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=GJtFmWuP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ey/P3qK+; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="GJtFmWuP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ey/P3qK+"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A4E4E1400166
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 06:45:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 06 Oct 2026 06:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1791283551;
	 x=1791369951; bh=C4gS1mrdzGZyEHNcX8oPdYcyRpMYGZeHaaYB6VPfr/4=; b=
	GJtFmWuPmsvtJK4iGH2wr+0fJiF/vgbi2BE5TLShefZc/YzO4lgxsVT1mujksbkj
	9LiOLm9e1/vNqDtprGg87mdfUZtmVc2qp5VtT3znnWuhtUjlQS1qjkUuOdLe2k4I
	uHo9J8dFIcvcFNRLZiE8v0nQ4348gy+odmm/Nsq0BYIN01RNjoJx217A1RX6OX2b
	YThbg5Q8wqrrXTDS/Rh/HiNyjY9qEALSMHRhVLYYh7iZqlgrDQuOjtxoSvoK4EMV
	I91Qgswx63axh8E3s/U0gIqxsJM5yfpl9iTxpzBS1yT+1bpOPF0UGk8weQZbQS8s
	kXxGHvQCiWePx2cApmTfhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791283551; x=
	1791369951; bh=C4gS1mrdzGZyEHNcX8oPdYcyRpMYGZeHaaYB6VPfr/4=; b=E
	y/P3qK+A5PyEe7+WmdYYmoyAXVaTLNBMlJ65Sw3mEMfTUXJRqx/UqA6Kf82RcInJ
	jJrwxIoFAoK4qlWQHsWiIFD1yMZhE/Ii/7/D8ePwqj12Pqusi3WC9TEIpteW5/2i
	W/Bxu+8o9oCxe64FVaP4CktrQSv/qhnJDBXMIs0DP2kB4Qd5OVZHufC8lCKT9+1R
	dnab8iS7jRZHCpaBI9bSBjTBCdCwCUT4nxcYCPq0NZkJUriAfAt1d9HLALa3cvaT
	5H+MG7Gb+tTkEl4BD/TrkmkyDJWEfv1kCEPisEknUnrkFw+GONUruFjfktcbLNLu
	89wlloGhqllmGaBLUoVKA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791283551; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:WNMe/fuWbbJfUog0q5kfpDvibmMtqqpGSt4BEK0Om9zL7XT
	1jPIsYn4buLiQewafthLfnU7u4YiHCYS2Kxl1Wf86EdPEOOABoO4CndsaL5KsWwN
	TyI7EXYlBTj0Pdmu96ubU8YTtpeXk+7ejxYd37W1Fik8OROkKTm4S+gTRdsNUqRv
	T9uqF8ZsU4Rf1ZuvGsJEErZkI/gMlcssK8P1YaBuaNxJiA5xz9uBtICiWuMGTCQe
	TRNesUZiqV9lfTUXiaeajY1NtM1tBiWLtEjMm4awpvhczAW8MeJAvDJDoJymBICR
	blwoKdP80/Vbtr5kE/sEBJY/XvrWUWaDpM8pnJA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:pzdmtJgjbNy+WiPvdAyYwifn6KAwUgmimkie6AyAc8U=:hYnMIuf9IJ9ZXwf35KrcykFHtQwQCLcRpmeWfFT/tXo=;
X-ME-Sender: <xms:X9HEaowfHzLV7bEv776C462BzLCsojYLaC7V__en6IOX15tq1jYGMw>
    <xme:X9HEahd-KPtFBKEAsEWVT3migvkdOer_IWN3EeFXOKHuCLnuhxw4-EZ6-xJS3VArM
    qzwsavi4w3fJMyIzrJQvYw0nFa8nMqp_nA4vF_j6H5FXCT61ZVx>
X-ME-Received: <xmr:X9HEatvhJKAEUwbfgEr3JA1_Ah9v2rNuSZt1trQnspr7wEzdYUndQ0oQ1oj0xL0kNJsVTon1uzpLB5FxkBU2PPc>
X-ME-Proxy-Cause: dmFkZTFy4ly97poWc5eIB3CDioH0b7lk00ywrvxtI3dD2vlH5skS96JyuW8PGyM4KCPx/N
    U77fhS90DigJqJud0V3fVaAttDCxLkq/UnS2mJ/LRpXNeDVazJ/atUMxnDr+P6ix9Puicw
    wVB/Zrj0LiFcbzQhepuNoO/sLOC49ACMQz8n4kghT5mI051YmmuJpJLlLACRMGlp4QjApF
    iYnBwSWLmBVHM3abxjVvf83CelErZCLqqUdBW1PMFkyfwASS3xnAIAFWJUFQuoUBmtgE5B
    db3yLg+Kly76VNzLpIq+Mg3NrkmTvg8R57TPp9l3N2M0LqNvDvKdXktiXFtLeI4iLErbk+
    TZccKL2fF4mIyHRgvl6WwUCyrMazL6TvX/Q1O+CyP9BWbHXGgG4k2M52Z57tSQmW/5XrK+
    Srb6HPtAcKW6OxlDEi4mqMEp2ldjXoG1TQ2xC+4X/pZoVpAA4HjPCN//3osh1+QAR+5XfM
    NyHZUiijvx4zrAh6QH8VLhVZ+R/ErlVn+T8C5sYJHQo6vO9vE+vUOBKeYmSVRMAYDUZ7R5
    s3k/j9FJ6Nrif8GWZsuHPXdyApWwz8BpEGqp4fEPwusEyPdTcP0WiJseYQqgvcGGiqRUvW
    R/rdrhif3lUBCBZi/AacUdnhZGetMkCaMKm2zKHVYH7pEw4J1zAPRzbsArDg
X-ME-Proxy: <xmx:X9HEamAroRAiCFuHBTqtNvleokLi1p8sL1uhNycEG0SRlPvMvIeFGw>
    <xmx:X9HEalFLkwAPVFbv7wc3va4mHq0RPlXbYkzJ3e9tKhrpIisf3G84Tw>
    <xmx:X9HEamtX7oFjLY62Xnnhcb6ZnVwSA54-v5YjJCnmLR3iMEvGFk0wZA>
    <xmx:X9HEarnrZBiAFqskCe9AmTeUF08VU3gwQTr3w854DPwEc9NOdk33eQ>
    <xmx:X9HEamvJWzOuKhz7K6v9iqLVBctDmQrkbLmxWFBw57EgO8rOrjrXr-E0>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Oct 2026 06:45:47 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/7] leds: aw2013: Rename internal APIs from aw2013
 to aw20xx
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-2-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-2-108ecbdf2775@postmarketos.org>
Date: Tue, 06 Oct 2026 12:45:39 +0200
Message-Id: <179128353952.5667.14752630401954655843.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791283547; l=470;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=hYnMIuf9IJ9ZXwf35KrcykFHtQwQCLcRpmeWfFT/tXo=;
 b=gxewX2HL/m5lL+vuOpm4/Sn4pb7rX32zykPyRQ64FJyOvP41n4xMSX0ZL2bkRsdWCMItg/UYL
 59Ank6z1sdBDrzQ1ZZ6PezLrbMyXOmfwn69MzmC3izAqZxKlUAbii6l
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Mon, 05 Oct 2026 20:46:03 -0700, Paul Sajna <sajattack@postmarketos.org> wrote:
> We don't want to break external compatibility, but it's better
> if the things shared between aw2013 and aw2027 have generic names.
> 

I understand the impulse, but the preferred way to handle this situation
is just to rename the properties unique to your new driver, otherwise
this code wouldn't make sense to be in the aw2013.c file anymore :)

Thanks,
Griffin

-- 
 

