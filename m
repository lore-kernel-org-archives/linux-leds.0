Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782886;
	b=enME2hHeAVi7BT0mFuYOzJiCDCIbZS3wklDrw1w6ni2lrxgOleYVgoKv6YEdtWFqBETa
	 1gHVkZYfG/YdWzYrt715pLTiE+FGK9ELH0yVTBXBCCJYOln4wr4HeoqL0lF1dzrnLOswh
	 yhA7SI05V7p9OYJGUPlaM+8RvTwZE+iDhOziIMKOL0UBdtUhxw0JBDu7SIo/au17f3Go0
	 keNnHzwNaaeLRnd/93zr9LZAdoFHk7i03M/nBfWcRWZ6RPRrD54SbUiqkJ04eHkz24rUh
	 h38hdWLt14Ond62jdYdLQCMRQV0hfXUVzSVkfpdeqpyWIWro7zoDAGzYcAIr/hGNHrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782886;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AaKiM9W+fdOJ7e3/KZVbbDmGDM/hjoRoSVQ8Q/hFZsc=;
	b=qW2fft9vmRS9wUzaZef4jY3xQdfvV3kNQqjDUsBlsYGMfiRYMgmlHbhRflud8Q1z6qpb
	 ombE9AAuNTIqpZQtV8r0jbMCyP5rxdvilhZByer8G4j91lAa91g7Dzif+CXfiXmUathyF
	 61J89hJkqr9do/A3BHhOJe6roWcef32PHL8vTtlsEW2CPeeZDBkkuE60RibFwPzNfuhet
	 HqFT6apITb/sTpdUb1lCXd/jrv3CVN+OF7T8dkcEIsK5p8FNSgnU+p1w9/LZR8PyurAuB
	 bwgOpu3C/1LZlELvS01EG5g0WRNRi66fOChjPtjOXFhBHfNh4/uDdtcN1HehzrkVSHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E413606A31B
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 09:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E413606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso241852a12.2
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 01:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782886; x=1794387686;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaKiM9W+fdOJ7e3/KZVbbDmGDM/hjoRoSVQ8Q/hFZsc=;
        b=Abeg6W88KJL0QAxOhpN3JRphPRm/NMF/sW1QwT5Hd/aUkjpt5VkcR1LFywF6LeHF5T
         dL6HujCZJr6fNUlrFVJH3hfq662c8TW8PgRScofWwXp8pgoJ1HTexm1Ym1eI8+JE6Ud5
         mDZkGHFawfSBWhgALYOu7lp0WYPA9TpxJMYm0sEpt+nLvhIqWuRVNQOJX9FigdHt12MS
         8ZMUwCcCOU1R5ebi8TXtRdZXcqZbbyrUdMP6Y3Ko48cHtc/Mh7tZYqSnLlBpeBKAW8X1
         nwbXXYySZ7aCuRcVs0uE2ixjHayllD/i5rCHuQ2TGuwyqkVy4HiO08R0efZbcs9fwARD
         OIhw==
X-Forwarded-Encrypted: i=1; AKwUvBxcTVtlrAZA+RKaOurD/iqZzRHqaYVTRi72p+HY2SrnGUu3r50GRLVxE0AMj1822iwdQZLZ+ZZdJLzS@vger.kernel.org
X-Gm-Message-State: APuU4Z+jb6k9dNmP2usjbhtydLPssOPQZKX1sw62gTzybEtHJzFwqEia
	MNrXIu/DRHFW3NWs7BvGCji9+55JvThjJ5hFqwX8vxL0gDYul4rikN9J23J5zQ==
X-Gm-Gg: AYBFou0XAxSeUO6WMD5FOX50dlnovSROX4Sc0rd0BtMn/AuqARHspx4ZLqlPoe0qzGA
	w6lXfF6qrmS/vpRkbnGTOXgPZyaAV3lFbACkJgs49d9rbhYWnTHT2duUSEdzwqYXkPeHXzTCeIs
	CodY2ttyPrTGAewesErCQqIvSbFSaMXnCGOQmYmX78R2BjPo47DlpiFqYEc5lZ7o2DKorvAygwt
	3W9tfwq+vquctbLgohVXzoxwbNxwzK9gEiyHVIzlZZd0kGJQ7pLyEpPw//Q/lnPkaSmC9i8PHzG
	tBEpLY/yeWGiRFIS1q8rlIVnXaeqBXoljr38Ing/9i86ORSJM616vU7aC8JwJM620nRtwbmEanU
	LcWnlEKJ6rIlL+f2V9Fp8LIIACd0D0lP0qS0AMgjkxhhPiLblkZIF+Sr0u07Y+WpO1rjOuz4zuH
	cXdXNCFvZJXbRFxjIrNWPpYNJnFpNbEOZEA6HXrh76X/ENjTchpy21RKJB+znXGLF10+68zAjpa
	oxGkGLBVETGmAMgBfOlP/L9o8SFzXAy8wbCgC3HyuzeZuJ+zCAsPUSBtsLxNpeyWX8LHt0uh3GH
	H9aoLoMweHxG4SHP4qwAA3UW9YmofLPe7GTzZkyGeEkXSBbd/lLfKc8EmcSYBZAcr86GkEp90Tw
	SS+SgvLmkoOs=
X-Received: by 2002:a05:6a20:4325:b0:3e1:fe8a:2440 with SMTP id adf61e73a8af0-3e928f9c31amr13502735637.71.1793782885765;
        Wed, 04 Nov 2026 01:01:25 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb499d63d3sm570197a12.16.2026.11.04.01.01.25
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:01:25 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35b2c599f43so907470eec.0
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 01:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx5nBj5fV1myWRYEi+YOWFJO1EqQKTI5PBQhhNtGtqF/MfAGMagn41pIjfTbDX1XT9pp6XdBRTx30XV@vger.kernel.org
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id
 5a478bee46e88-36a423a205fmr27260638eec.16.1793782884949; Wed, 04 Nov 2026
 01:01:24 -0800 (PST)
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
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev> <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
 <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com> <4fb6c428-85fd-4674-8480-919191db1277@kernel.org>
In-Reply-To: <4fb6c428-85fd-4674-8480-919191db1277@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 04:01:13 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7CY6hitrp7xk6=r65EEQNYc74RYg-BjVSJo=6UBLq36g@mail.gmail.com>
X-Gm-Features: AclHuK9uQeJIR1NfXJqyf9nbtbfdJiELHYiw7wy3ZTo2enB8PX2i4vU_7m4oveI
Message-ID: <CAPY4CJ7CY6hitrp7xk6=r65EEQNYc74RYg-BjVSJo=6UBLq36g@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> No, it is not. It has clear and obvious checkpatch warning.

Sorry, my wording was ambiguous. I meant that I've fixed it in v2,
which I haven't sent yet, and v2 passes checkpatch --strict; v1
doesn't.
