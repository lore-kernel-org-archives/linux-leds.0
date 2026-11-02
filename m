Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587136;
	b=P9lNWqQgN9ByFSsF0pia82QQK5bOJsH3Ax7IUd4x8IwcnEBmJF17aCh5CVPVRS9BfSIE
	 lRdYx75z3otCBSICHKwP0dpr8UFq68s1L9EPifJ3zWZUPqlkdEduTMaJbVCE4CToPHPbF
	 fIIXGQUXq+wNFm2njIcpwxxSfHpgce+EQSQaQfTQipefSxy3qCnk2FtSR0QNdDeTiayno
	 yCqJyhKdGLANMEQw73qvG2S4SXLEr24b0oRdl9ttNh5wECGHtQSlZ19l2TLD6qImt63bN
	 aRTVD9gtLVXGdLwNaE39eNF9wIv7VqAUvrbZqF/ECDbbBGdTEpLr0+aUQFMQ6KS8kuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587136;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jci9qiUbYMeQLnsVE23Fk/bmS6/YaF98wtPe2dPL9Rg=;
	b=bLz2bUCj5S5HzXl1bdd5HPvvwOGuiv8yHJhqbcAKfKH2HffMTZn1iERRYGRVvOcESEm1
	 mikB7sr6Xg7kqbi0vPo5Bpo3DMGFh86oKMw2wLQP9UFQrDbMIuZoG7mk0cF4SMbGeQ07p
	 O4pIl0WmW3b9Y4GZqhvkIve3oqa7sh7/ao8+C2d9rYMoG7Uy3v8NIBa3AVVe0ziUA8dP+
	 kfdaImBcvt/balnpuipzDlDDfUQWVacblr9UJTZ6K+NhfLiSpsvEbQzkKL15e4B9ki+mU
	 2S3srkEE1Evx2kD1R0qR+jk74fb6spi31QQSV/WmBzgcFWZjmsa9RAQQjqijf3kt4BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25430606A32E
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 02:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25430606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1108605a12.3
        for <linux-leds@vger.kernel.org>; Sun, 01 Nov 2026 18:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587135; x=1794191935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jci9qiUbYMeQLnsVE23Fk/bmS6/YaF98wtPe2dPL9Rg=;
        b=V4mBIKNgsxNl4y9ZAqGoGf6sU1s/1CatZMFxXHfmHW9K6/joXwkil8QQClzqvOkN0A
         kDVa8G4gwrbnngebneTMAGvwcAwqMY5HUZF0UaDNQb7mYpOEfDGBCt6L3w7LY5roNnOz
         f4EOmW9m1Jz4j2eSQ30X5yEtq2FViNdX8u81tHdLsOjPC9oHr2YNsu3RejGBSy2gLQ+y
         aEtuQWbi3HaA0iFdfkWlNOv1EmKZANsDR1osiXHESr2XaQ1qe0oq967FTurBmpy6jnUa
         p/y4vnGoOAcncLOkp/GOht9MMxftm6hGQWAMpycudsEy3f0UKv7KTFK7dhkk2xWAR1yy
         kzvg==
X-Gm-Message-State: APuU4Z/cZ2NipLydaHbTWg56RRpwst5Oz4zbfdCAElaeQa8o96T4tCnV
	yE3Mguk3FulFt7/P3mTG+2tgUVc5iTKthU9CM7RFOK2P2gp4fkwphnc9C7cqlawz
X-Gm-Gg: AYBFou2drh6HNMsdSuPCyDrw5lanvYAhoL8Q7BZfbS4hWAdXhWi7EWMnx2qNd726da5
	UTay7wsQS9GJSFzjA4lUkYaJPgn0hJWueB22lE69SsD5rI+5m3geiv6i9p2zXaSPK0d5xWEKmxO
	mDrMSKVNclVrieKFApJkKZM4Tw0V5+hOLKc3R9NiIrOm3hdbjd+PGwXlWVQZMXrrCCqS8+DFbB4
	SEOHcDjd7FeDo5teyiKzrVLyIayfkkYjX4k9bYOP/678+hHSc00zV5tiWpf5du7Y/ksHfnmHNF4
	QBkiJscy4b08nEP/7tWmjTG9w5anskBD+9KJLRReqLtqSSWKN/WNARB8wJfeO9O3iZ53YfB7MaC
	xDm8LGirVdbtfrZBBkm7rG7cjqBBoLODteFFc2Ldq5QH2PKTSgKs/2f0zQ5TY+lvYR6YqxuNJ84
	zVihFhsStGCq1c8kHvIpmwCWFy+OG8JQfSugdbaLGL8FARKlCQSb6f4jYbLG+nDD8jhynSuUcUv
	j8swsERX+3C0evj7NZOB5TdP4g3QDFq2UXv2tsN+HlGy5J4OqyBQd201V5lyGov+NxyR2nFOMAp
	54f114e0XylzZrASxQ9nUx+05RpJKUmGV8jGX7Px7AkRYJrgB3J+ckZnNygFQzchhKZKJiHY0Du
	hS+JhyTDLESGuOZEvRihH87VYEjnX1cCFIfn/5QlhCcWmc8IvGoZj9ZyMG1zFLIMI
X-Received: by 2002:a17:90b:3d4b:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ae8977640fmr5633296a91.18.1793587135522;
        Sun, 01 Nov 2026 18:38:55 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm7528857a91.4.2026.11.01.18.38.54
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:38:54 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-353804b591eso4512984eec.0
        for <linux-leds@vger.kernel.org>; Sun, 01 Nov 2026 18:38:54 -0800 (PST)
X-Received: by 2002:a05:7301:db8a:b0:36a:279:c93f with SMTP id
 5a478bee46e88-36a423fda77mr13492128eec.33.1793587134291; Sun, 01 Nov 2026
 18:38:54 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-9-eb51eddad08c@telaak.dev> <sashiko-outbox-192833@kernel.org>
In-Reply-To: <sashiko-outbox-192833@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 1 Nov 2026 21:38:42 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6GHfhAp9Ck6WakVy0yh5YjG-TApW4zaOp6vAFDGivTaA@mail.gmail.com>
X-Gm-Features: AclHuK8Yeg2RaovImaieDc_RzvYkCKj9n4PkC3wjqPhvqeEv6To4mOIylRyTbUQ
Message-ID: <CAPY4CJ6GHfhAp9Ck6WakVy0yh5YjG-TApW4zaOp6vAFDGivTaA@mail.gmail.com>
Subject: Re: [PATCH 09/10] leds: rgb: ktd202x: Fail the probe when the chip
 does not answer
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 9:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> - regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESE=
T);
> + /* Nothing is read back, so a failed reset is the only sign of a missin=
g chip */
> + ret =3D regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_R=
STR_RESET);
> + if (ret)
> + return dev_err_probe(dev, ret, "Failed to reset the chip\n");

Please don't apply this one as is. As Sashiko pointed out, the KTD2026/7
does not ACK the reset command: its data sheet says the byte that resets
the chip is followed by a "not acknowledge", which is to be ignored. The
ET6326 I tested on does ACK it, so I missed that this breaks the probe on
every KTD202x.

v2 will ignore the reset write again, and fail the probe only when the
write that puts the chip to sleep after the reset delay fails.

Joseph
