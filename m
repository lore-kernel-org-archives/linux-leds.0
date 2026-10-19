Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890B044E67D;
	Mon, 19 Oct 2026 06:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392113; cv=none; b=jYJCjD9OemNmiIKp8l8mRgTchqXaXmUBC3xh4IG7IP5cI5FIivdLdyWY/FWozP/SqDwof/PwMNGNi9ZGvepYCh+P0K4quoesW8JAz/COeihjuO9W8xL0w4WT+LGmoOc/SMRCWty2LorO/FMS//NwlziE4vBSB0LZRim4NYShaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392113; c=relaxed/simple;
	bh=mi5H1NCE5aKaHjd2HwK3TS3X/UUPrsS8S7xPN+RJFJY=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=SljmVs/gFLx6nfP+OZKRvmJSz/X4+LeZYWv79a3u033vtY799LBo3cTuEHH/oFqRw1oN4d8ULAxykhdKZpQrdn69Ho2UekfpOuScNmZb/xTZvvuS5jn+rBIMruBNeof9JKdWUA4lNvnEF8lOdbc6AJRvvATHxMU4kkMJoduwrk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=mVAZKS6E; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="mVAZKS6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792392074; x=1792996874;
	i=markus.stockhausen@gmx.de;
	bh=X8luB4Mc1hr0i0vgNZ+3TmvNwTbJK56l7F27Ty/vAng=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mVAZKS6E7UW7Dn/6AQSvP9CEIO07K7fvZGF2hpScxZlXWsG33Hby3BXcBQy3QeYL
	 eJgGdBfUuSMVYpg1iD8ZZZvdRk4GPREKK7toBmA+GqEiChOBED8GYAn2PCYKlS9IQ
	 JpP4pRflTwIvZ7+SxT9iF2gX9xb05vvc2Afyvwpd/8n1EEMMX1nQ29yCUMKkOm6AM
	 P1z6gTmbsXP3A6SVZ10xFfwVOsSKnI769BDcALNFlFG+Yc+SGItEo0QQYNefhFr1d
	 HadDztYjN0nkg9sziR4/FKY273pAhCq0Snn/Okr94eBR7X8Q691hqFZclmrrP1GEF
	 9wPrPFUJ+FU8pJokqQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5vc-1wwkMT3jqS-00Oa1f; Mon, 19
 Oct 2026 08:41:14 +0200
From: "Markus Stockhausen" <markus.stockhausen@gmx.de>
To: "'Ross Cawston'" <ross@r-sc.ca>,
	<andrew@lunn.ch>
Cc: <lee@kernel.org>,
	<pavel@kernel.org>,
	<robh@kernel.org>,
	<krzk+dt@kernel.org>,
	<conor+dt@kernel.org>,
	<chris.packham@alliedtelesis.co.nz>,
	<andrew+netdev@lunn.ch>,
	<davem@davemloft.net>,
	<edumazet@kernel.org>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<linux-leds@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261018194339.132-1-ross@r-sc.ca> <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch> <20261018232015.527-1-ross@r-sc.ca> <38ca5375-ecea-4361-ab26-c044f38ceadb@lunn.ch> <20261019054233.1884-1-ross@r-sc.ca>
In-Reply-To: <20261019054233.1884-1-ross@r-sc.ca>
Subject: AW: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under software control
Date: Mon, 19 Oct 2026 08:41:10 +0200
Message-ID: <010701dd5f94$d636ff70$82a4fe50$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKS3mjgtCHAxEvchmCWIzCJqjgszwLFeSyTAnQPNfsBSDL+mwD4bEuwtV2TWLA=
Content-Language: de
X-Provags-ID: V03:K1:KvbP/2mEFFpnK9lE47Mq9Lh9beIgdtaEbr0yuH7InuSC6aLC55M
 ppLj6h0HeM65gDw7xew5qXthc8g4L/lAU02m87L1NjqJPepKnzfsvnNSso9RXYoTj98JIYd
 4emh4nxdbwC/4MscKb/0NG3m0XvwRXgQDFf8x86B6tpxiZcI6kxqacxYNHNL5MnOcKxY/4r
 CLWPSR5iEnxdeQxf/TVkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OO7Tf0xW40U=;S/JOCM3h6DKBrwSkIecjbsscOiB
 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
 WXmDBcdTUVSjknhcaNKw=

Hi you two,

> Von: Ross Cawston <ross@r-sc.ca>=20
> Gesendet: Montag, 19. Oktober 2026 07:43
> An: andrew@lunn.ch
> Betreff: Re: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under
software control
> ...
>
> Thanks, adding Markus.
>
> Markus, are you planning to take the RTL930x switch driver upstream?=20

While this is the overall goal some day it is currently beyond the time=20
available. I'm only two months into the nearly abandoned Otto DSA=20
driver and just keep things rolling. As of today the operation mode is=20
more like:

Some commited contributors are throwing AI at the hardware to fix and=20
enhance the DSA driver. Coding, testing and PR submission is runnung=20
full-auto-mode. So a lot gets documented during this process. With my=20
limited time and knowledge I'm doing my best to review and organize
this to some extend.  If possible I ask for refactoring or add simple=20
refactoring PRs on my own.

Markus


