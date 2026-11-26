Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699836;
	b=Uz2xrOZzqghqzqxEnaQ4AknROck/d8Mmhp119Zk8TTy/+KDZ9s4tih131K7sse+xQFMO
	 SW37s92NPM6SI9sn1sWsoUjRXRTmucK2bk/LPHPZI9cprGjiwhwbOW/CIONo+0mZYN0No
	 ssjmQ7xSHiiev7nFfvBH8h6OBlkKocrqTB1MIWrj2lnPcnG+KIZ9di1NaFDhX58ZLnHOl
	 D0olG8GF+LKiDadx9HoznhyCS1j490w2f7etzN47+gHErLl8oENxnF3m1/f1H1emal/Jc
	 48wi64swesiqkNvB9cxVJl2udvp2FqpO/Ol5qj5mnSJ8kb6JJN85HArfdHIEIxgy15Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
	b=b5esluCaMkHi40pzX89siXkT5e1Pwzczm8WOHh1nRiit/grdk3itaBWj9gVLckuGNrr5
	 +4O92eg1ZfdbU0G6dtBZDgUewZWiadWUIpWDaYlyCY4Ap0PaeWEwhW4nomXtf0T+gq9b8
	 qCHFCeImbB+Oamqg3+oBScrgXQoeL2/GswCoul0ATio+la5mtjqeTfKaEFYpdh2ujlkHs
	 eDnfsxv2FQy3mWSsrUveP+dzy/cF4PvxvSfRHIq/wOjw8zSNtdhrc/RQShMtqhYQr2CAE
	 hVltPr04EJ3A9BkbPfPN2RoRAl0DqSeHjZ3062lDB/fJz1PJWUY9xquv25D2UlWhkcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iz8oGwyO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EF1606A31E
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 13:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EF1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iz8oGwyO
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386bd881d39so6951764eec.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 05:30:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699835; cv=none;
        d=google.com; s=arc-20260327;
        b=ABMrzvmffVrZEmHdbTark5ffIL0tG6Wf6gCV+GRirpfe1a1mtC31zLXl3ivxba856X
         EvHoDsLY7HWMajGS0aCTwlqPVMlBLMQ9Yrsyfr6A2bLVHhSSQtKtwiPToMZMXiS7yGqS
         BWp95hNrHOUHFEygBo5Nr6+fLFlo2c3jvaZnLJ3HPc/4yYhkCz3Ik/Y3JzxiGzotgztT
         g/Oko+zbPwYhVUlPB5W98QTfC0n5bJepp8aLaxxChTb2AUJbV9AlfJeJ9CFNA3DekRfi
         mkDJDmW0vEbCm7balwUrCY/Dzgycnzj07Dr4bLF1fJurPL0JgJE2FU+tfuWQ1z7r06vn
         lqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        fh=AqbWydC1QU9z078NN8dCtPg418BymJ7VQXvdYoEcaiA=;
        b=hpLaIlQeFvlduj+gpTCsr7WBUpMuqAPFGXB852RZmftu00ZpcvToL47CGiR6g3LVGy
         hW4BIQSOgI6bbJwLxNJy5K/8LwwjtoNJVvCvY+Gm8qauC/oZbU6p3goewtR6ct05Lk/f
         U9u8oc61bWG9aVHGUS5C/Veuyt0WfNRduEuYXbmHXGpgQrZNpiR93cHfeZ8wxAq06VXN
         dlx54lLF/l5KBfpfssHMUmY0GivPByPTQ8AzeSJpU9ekDfBockLJRROTur3TqzkGFD1D
         +lA8Zskap8YjWjTRAO+PKWYKR4sWwgtQhylZPxn5HJP/CjW2rE6DoChFtfiETMsFj3nv
         dsng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699835; x=1796304635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        b=iz8oGwyOO09o4i5dWB91D4ghISsBxmFjH2tehPipI789M9ucTYLpa7LONDMVVl6ICL
         v6QuocHdAeNYP9nvTFW9XIXOBgQGaueGU2YlbdDOPj5vcjRZgbC8tm3zZxQ9omvYcXDi
         xB1pI6bJGoMuTKu37WkNP4tGErBsJVIZnBjisgqpvYrk/cF7dCP66d56rMov1NMAvlKM
         h85ENOl4S8WOzUZMZUA0MCIy5oGQ0AyLFlKk+AK1WfOvUS1/jSUjI/8rI33VxjXZ+mc3
         EAY74D0kL7j3CP0Z/HH5p80XtoxuTKyA6lmTbLid4SC68C1wk5YyGkNvgeHQVoZm6sd8
         b7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699835; x=1796304635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        b=F5mVwSfyaIVLTxKZhnByctnbFQcd/iKqQAAMQaCLcHYGdYNSc9zs5wUsnLwLnwZc6v
         XvOu66Ze2ZIdN7RZC8CepalzJ1MzkQz4sof4aGgMW3e8nNlTnrgBLFYVpt+4qkb+EDdS
         3Y0YWGPNgS4C1e1mFZDQTgAJyQ9Bm3F2mMfXkQxk3B48Bs96gvg7LwVyTAxIlIue+zoY
         TaKh7Oij3zL8WOani4QHbZST2eNsWnvr89VeizmEYP9VVUUL6az1vvY1XNpYKBczArc2
         pbwUXAJbnyn01it4uTBoAy6xvg3orfqpnrqSJZ0CQ6HQVyOD4PaAPjQs/MBl/yQ4WoEU
         Citg==
X-Forwarded-Encrypted: i=1; AL+hErEjET26wQ1wiaXi13167QGxN+mscB6Sy8nFfQIgyoTC2jDABVhBex5Tq2J6MWQO4Djt7VsJqMlXRWlY@vger.kernel.org
X-Gm-Message-State: APuU4Z8qCE6M3QdMMCTgxbarT0LOpy5gJ8Nf2ka2XrsN2qBCn6ychsHA
	g2L9kl3Qh7CtZpaq9H0G8hD8uJakK1mlVDE/yTLJNQLPKMb6zuDOtYzSsITBul9ZUXNY5WCpsyr
	56/W7Cvr+3X3oNdXXcgN2gmd+XuR0owQ=
X-Gm-Gg: AZFdTZdAitl8joMHHvUoLkB93DWS8/Ot6qxD4Pfhg+gRN0uX3J6nA/vR0NQMugvbbgh
	yU86EBpf7wy7vIgOMn30+APkAaDVT89l+6UG8MsU2+7f7AbwBRj1Q3b/dypSyU9y0y0ZCvAi/ET
	A3fEhamPmMH5CGajKw7HIgAeQfapOglLd9SSN7WoEbKYOzxwE7lKQW67ur4bMKH/XgVPMGONBy3
	N38txA1uHT0wxvyyIZwVYwj1dly8ggileVGkG6NylcvGroxxb5WsWfxINpZjGNcYX4qb6zAkX4i
	HxyqnApxY3t67vAKC2htWMNtsBOcxARp9BGnIY6YeqoSQRn2310dO3PQjz4k8K6jpahgnanDXfd
	7iExBkpAT3IEfNIQyuQC3fPBdqORVFSqkxfNfahXRyuZUkkP+sVX/KKdGB2l5KSclG11nibnzUC
	krcisUBywS74chsivcOxWgxAMuFFVYe8Z35A1ip+9M0QnoRf5fmcY=
X-Received: by 2002:a05:7300:4721:b0:386:da66:671f with SMTP id
 5a478bee46e88-386da66762cmr2781680eec.28.1795699835188; Thu, 26 Nov 2026
 05:30:35 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115090520.102216-1-clamor95@gmail.com> <20261115090520.102216-2-clamor95@gmail.com>
 <0670d537-0f9a-43dd-9d48-90272f04f1e2@sirena.org.uk> <20261126122936.GH38590@joneslee-macbookpro.roam.internal>
 <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
In-Reply-To: <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 15:30:22 +0200
X-Gm-Features: Aa3M54phpO9TY-BjFhMXHRwC2_FlICHLesKqjIioZHRgOyOaeZaLBv9530oQbas
Message-ID: <CAPVz0n3tpcEteSfU+51_FeJaYYMwz522h968nWHSw2gz6+336g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document
 LED support
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:2=
4 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 26, 2026 at 12:29:36PM +0000, Lee Jones wrote:
> > On Sun, 15 Nov 2026, Mark Brown wrote:
> >
> > > On Sun, Nov 15, 2026 at 11:05:18AM +0200, Svyatoslav Ryhel wrote:
> > > > The Maxim MAX8907 PMIC supports a single LED; document it.
> > >
> > > Acked-by: Mark Brown <broonie@kernel.org>
> >
> > You should just apply this, I think.
>
> Well, it doesn't apply so...  :/

Obviously, Lee did not pick up
https://lore.kernel.org/lkml/20261123150224.199601-1-clamor95@gmail.com/
