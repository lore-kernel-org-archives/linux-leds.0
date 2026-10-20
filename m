Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527408;
	b=OXXqVJYH46+sM2O2Vgdl4cWpI6YH/YvqY88o53IE06Qm+9xwE1EpXgJs0Nlto71adHuC
	 ipEorfklSsOYCyLSbgaIKCNGLmRSNDdbzz9NjjuHBduHvZV53eSVBcNLa5Rm26k1x5Aqs
	 mdTGkXjJbWwv5n9YHz3PEj5S4svLZkW/5TvBZOA5Qal1ac25iyqshr9UUi1HI5c95L2Qs
	 +HDUrg+oezgqcDhYPpARUhwcuFgDUj5HZupRdF71KrdQYPQH5VN0hSGFLvcPB+wptVhbL
	 jlppvyJhBu766FM69PAovd+HKPSGGCH7pAnUVDaGsL643BVR0xolJvCgUvmVMKEXJ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score;
	bh=lGGqMygbUi+Y25JSyEHdD3vPIdAVBUUS53m4PDKIUm8=;
	b=P/I8UfS8uNHjbXvVZVCVoAtKHTB318PBRq8DiDQn7yoSjKqebyLzqmhITcvunTn8T5Qg
	 CjYlTne48dQ20H9Y4OUbwoMvH6s9qtaKUMUw0ipBb/9OhUuVyV+P9Nf3cn8fnpZIr8zsf
	 tPRpyYw5vFC6FMoYPt2GEAMiwwgpHJuM/OZfj+gJcA9o39dpysgw29N93JmGkEMkVbRwp
	 5rNcCGD+T9LQXbjw0AoI5KJT6q3gEDxYhqoqB7Ydaclgofmvuq2qBN8sM3+ZSixsmTNkY
	 IQBHsABO0bFtw6O6/UxsEGuPhs+tjNYCgxyFe8YX/Hlj+/0W85W++vNjsWQiXtdrfjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	dkim=pass header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=ZgKkUPYD;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE6606A31E
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 20:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06EE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=ZgKkUPYD
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 481C42C057F;
	Wed, 21 Oct 2026 09:16:34 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1792527394;
	bh=lGGqMygbUi+Y25JSyEHdD3vPIdAVBUUS53m4PDKIUm8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZgKkUPYDoXTHGyyxCnwKT5xOJp9ROSlH18rtsT7a71znNrIVj5KYCMuBU7wxebTAZ
	 V9Ra0y6kOkkMNOTIcDDag2zOL251GCl5G96dkUfUO6lELGjqMsX4wMUqf3vIVhrd0o
	 NkElALC6T62frst9EVXhXyi2POiZnVyn3yxulCTt6g9JZnEpCXf1z3YuLsAjYWigzc
	 uSNIiEUDNVLffb2tUkH7pBVQcGyL8silIWB1btxthpbWe2L7+mxArenIgB1mTeQ3RA
	 pLGZHc5lKaYIUfkDFtAgSVREVBspc8Ii4Kp+nNdpikIkj7+htUjI/i7L4bln6a19Lz
	 aP8uPnOfqXXNg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6ad7cc220001>; Wed, 21 Oct 2026 09:16:34 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 21 Oct 2026 09:16:33 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.2562.056; Wed, 21 Oct 2026 09:16:33 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Ross Cawston <ross@r-sc.ca>, "andrew@lunn.ch" <andrew@lunn.ch>, "Markus
 Stockhausen" <markus.stockhausen@gmx.de>
CC: "lee@kernel.org" <lee@kernel.org>, "pavel@kernel.org" <pavel@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under software
 control
Thread-Topic: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under software
 control
Thread-Index: AQHdXzkLyWoGk3ubIUO2orwfvDHWs7cDCdoAgAAMOwCAAvFUAA==
Date: Tue, 20 Oct 2026 20:16:33 +0000
Message-ID: <c5f79284-941a-4a93-a37e-398613d5ddfa@alliedtelesis.co.nz>
References: <20261018194339.132-1-ross@r-sc.ca>
 <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch>
 <20261018232015.527-1-ross@r-sc.ca>
In-Reply-To: <20261018232015.527-1-ross@r-sc.ca>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4B4329473912A4C8D8743478EDEAFA4@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FJW4xPos c=1 sm=1 tr=0 ts=6ad7cc22 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=rzwT0FkT7oDZkIX673MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgUm9zcywNCg0KT24gMTkvMTAvMjAyNiAxMjoyMCwgUm9zcyBDYXdzdG9uIHdyb3RlOg0KPiBP
biBTdW4sIE9jdCAxOCwgMjAyNiBhdCAxMDozNiBQTSBVVEMsIEFuZHJldyBMdW5uIHdyb3RlOg0K
Pj4gUG9ydCBMRURzIHNob3VsZCBiZSB3aXRoaW4gdGhlIHBvcnQgbm9kZSBvZiB0aGUgc3dpdGNo
IGluIERULiBJZGVhbGx5DQo+PiB5b3Ugd2FudCBhbGwgTEVEcyBmb3IgYSBwb3J0IHRvIHN0YXJ0
IHRoZSB3aXRoIGJhc2ljcywgb24vb2ZmIGNvbnRyb2wuDQo+IFsuLi5dDQo+PiBTbyBwbGVhc2Ug
ZG9uJ3QgbWFrZSB0aGVzZSBMRURzIHNwZWNpYWwuDQo+IFRoYXQgbWFrZXMgc2Vuc2UuIFRoZSBj
YXRjaCBpcyB0aGF0IFJUTDkzMDAgaGFzIG5vIHN3aXRjaCBkcml2ZXINCj4gdXBzdHJlYW0geWV0
LCBzbyB0aGVyZSBpcyBubyBwb3J0IG5vZGUgd2l0aCBhIGRyaXZlciBiZWhpbmQgaXQgdG8gcHV0
DQo+IHRoZW0gaW46IG1haW5saW5lIG9ubHkgaGFzIGRyaXZlcnMgZm9yIHRoZSBzd2l0Y2gncyBJ
MkMgYW5kIE1ESU8NCj4gY29udHJvbGxlcnMuDQo+DQo+IFVubGVzcyB5b3Ugc2VlIGEgcGxhY2Ug
dGhleSBjb3VsZCBnbyBpbiB0aGUgbWVhbnRpbWUsIEknbGwgd2l0aGRyYXcNCj4gdGhpcyBzZXJp
ZXMgdW50aWwgdGhlcmUgaXMgb25lLg0KPg0KPiBDaHJpcywgZG8geW91IGtub3cgb2YgYW55b25l
IHdvcmtpbmcgb24gYW4gUlRMOTMwMCBzd2l0Y2ggZHJpdmVyPyBJZg0KPiBzbywgSSdkIGJlIGds
YWQgdG8gaGVscCB3aXRoIHRoZSBwb3J0IExFRHMgdGhlcmUuDQoNCkkgZG9uJ3Qga25vdyBvZiBh
bnlvbmUgYWN0aXZlbHkgd29ya2luZyBvbiBpdC4gSSBkaWQgaGF2ZSBzb21ldGhpbmcgDQp2YWd1
ZWx5IGZ1bmN0aW9uYWwgYXMgYSBzd2l0Y2hkZXYgZHJpdmVyLCBJJ2xsIHNlZSBpZiBJIGNhbiBk
aWcgaXQgdXAgDQphbmQgc2VuZCBpdCB0byB5b3UgZGlyZWN0bHkuIEkgZGlkIGxvb2sgYXQgdGhl
IERTQSBkcml2ZXIgZnJvbSBvcGVud3J0IA0KYnV0IEkgY29uc2lkZXIgRFNBIHRoZSB3cm9uZyBt
b2RlbCBmb3IgdGhlIFJUTDkzMDAgKG1haW5seSBiZWNhdXNlIHRoZSANCiJuaWMiIGlzIG5vdCBh
IHRydWUgRXRoZXJuZXQgaW50ZXJmYWNlIGl0J3MganVzdCB0aGUgRE1BIGNoYW5uZWwgZm9yIA0K
dHJhcHBlZCBwYWNrZXRzIGFuZCBGREIgdXBkYXRlcykuDQoNCkknbSBzdGlsbCB2YWd1ZWx5IHdv
cmtpbmcgb24gUlRMIHN0dWZmIGJ1dCB3ZSd2ZSBwaXZvdGVkIHRvIHRoZSBBUk12OCANCmJhc2Vk
IFJUTDkzMTFCLiBGb3Igb3VyIGNvbW1lcmNpYWwgcHJvZHVjdCB3ZSdsbCBiZSBzdGFydGluZyB3
aXRoIHRoZSANClJlYWx0ZWsgU0RLIGJ1dCBwZXJzb25hbGx5IEknZCByZWFsbHkgbGlrZSB0byBz
ZWUgYW4gaW4ta2VybmVsIGRyaXZlciANCmZvciB0aGVzZSBzd2l0Y2hlcy4NCg==
