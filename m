Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A62D7DDD;
	Sat, 17 Oct 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221491; cv=none; b=uTXuFBwWY4CJrZeCEg7IqNby2bJs8AGdVKicZ5LdKA5Y8cWE2f6SwYbzfPBya8csCVZtLRsxEMyjURn3NYpyCfGw7+MGmm3k1liy+ivwzmN0Fi8QsMbDSrEpva6hPQO7ZPumY7TkiCg5VZCJxOaXlrqSnCXW6nImQ4mkC0l+GMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221491; c=relaxed/simple;
	bh=sFgiLvLt2TfNsyl3fYaJAvaVewg+w0JALWtf6clzWLw=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=DNcI4PKVdKjvS9SvielZYhm4AP/HGH8nsBlZtxrEVOhoW0jugyBE0kgb2MW72iJ4wGW0PC9pFCv6aZCAn1Rvnz627erFX02W2rtHQ/j8QIwNRKcODNzPRYMITu33Mvle4HytPjBlN+2j616e5RfxlixAh8fSAXzOOXW+KJXsrzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TtlVd7kR; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TtlVd7kR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=sFgiLvLt2TfNsyl3fYaJAvaVewg+w0JALWtf6clzWLw=; b=T
	tlVd7kR5b8ebRHBag2q1WM0uA88b34uvcWJCCnEI1byN6OljplPn8I1f2pYOugej
	5kKVQQ1HI7SWzwxIaYwMetDvqh5RiFVB5a7lqd6elhseJhyYKiE6iuDA5/i76dlJ
	1ROG37Jkr6ElikKWN2Yf5AfmJcLf7R5RjWycyzK6E0=
Date: Sat, 17 Oct 2026 15:18:00 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 2/2] leds: cr0014114: queue recount work on freezable
 workqueue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016100435.2581303-3-yaojiale02@163.com>
References: <20261016100435.2581303-1-yaojiale02@163.com>
 <20261016100435.2581303-3-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6Zvkwj5iWeYukdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHUfenmxtsc0C5xu+Wfk//Zw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <547da4c9.1783.1a148b98683.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgD3X4YoIdNqWPpaAA--.123W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQjhHGrTISjkdgAA3a
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAxODowNDozNSwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgZmlybXdhcmUgd29ya2Fyb3VuZCBwZXJpb2RpY2FsbHkgcmVjb3VudHMgdGhl
IExFRCBzdGF0ZSBieSBpc3N1aW5nCj5TUEkgdHJhbnNmZXJzLiBJdHMgZGVsYXllZCB3b3JrIHJ1
bnMgb24gdGhlIG5vbi1mcmVlemFibGUgc3lzdGVtCj53b3JrcXVldWUgYW5kIGNhbiB0aGVyZWZv
cmUgYWNjZXNzIHRoZSBjb250cm9sbGVyIGFmdGVyIGl0IGhhcyBiZWVuCj5zdXNwZW5kZWQuCj4K
PlF1ZXVlIHRoZSByZWNvdW50IHdvcmsgb24gc3lzdGVtX2ZyZWV6YWJsZV93cSBzbyBoYXJkd2Fy
ZSBhY2Nlc3MgaXMKPmRlZmVycmVkIHVudGlsIGRldmljZXMgaGF2ZSByZXN1bWVkLgo+CgpGaXhl
czogOWU1MGQ1ZmIwZDE4ICgibGVkczogYWRkIExFRCBkcml2ZXIgZm9yIENSMDAxNDExNCBib2Fy
ZCIpCgo+U2lnbmVkLW9mZi1ieTogSmlhbGUgWWFvIDx5YW9qaWFsZTAyQDE2My5jb20+Cj4tLS0K
PiBkcml2ZXJzL2xlZHMvbGVkcy1jcjAwMTQxMTQuYyB8IDYgKysrKy0tCj4gMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbGVkcy9sZWRzLWNyMDAxNDExNC5jIGIvZHJpdmVycy9sZWRzL2xlZHMtY3IwMDE0MTE0LmMK
PmluZGV4IDNmNjkzMWFlMGJjYy4uYWZlMzczMGUxMjIyIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9s
ZWRzL2xlZHMtY3IwMDE0MTE0LmMKPisrKyBiL2RyaXZlcnMvbGVkcy9sZWRzLWNyMDAxNDExNC5j
Cj5AQCAtMTU1LDcgKzE1NSw4IEBAIHN0YXRpYyB2b2lkIGNyMDAxNDExNF9yZWNvdW50X3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+IAlpZiAocmV0KQo+IAkJZGV2X3dhcm4ocHJpdi0+
ZGV2LCAic3luYyBvZiBMRURzIGZhaWxlZCAlZFxuIiwgcmV0KTsKPiAKPi0Jc2NoZWR1bGVfZGVs
YXllZF93b3JrKCZwcml2LT53b3JrLCBDUl9SRUNPVU5UX0RFTEFZKTsKPisJcXVldWVfZGVsYXll
ZF93b3JrKHN5c3RlbV9mcmVlemFibGVfd3EsICZwcml2LT53b3JrLAo+KwkJCSAgIENSX1JFQ09V
TlRfREVMQVkpOwo+IH0KPiAKPiBzdGF0aWMgaW50IGNyMDAxNDExNF9zZXRfc3luYyhzdHJ1Y3Qg
bGVkX2NsYXNzZGV2ICpsZGV2LAo+QEAgLTI1Niw3ICsyNTcsOCBAQCBzdGF0aWMgaW50IGNyMDAx
NDExNF9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQo+IAkJcmV0dXJuIHJldDsKPiAKPiAJ
Lyogc2V0dXAgcmVjb3VudCB3b3JrIHRvIHdvcmthcm91bmQgYnVnZ3kgZmlybXdhcmUgKi8KPi0J
c2NoZWR1bGVfZGVsYXllZF93b3JrKCZwcml2LT53b3JrLCBDUl9SRUNPVU5UX0RFTEFZKTsKPisJ
cXVldWVfZGVsYXllZF93b3JrKHN5c3RlbV9mcmVlemFibGVfd3EsICZwcml2LT53b3JrLAo+KwkJ
CSAgIENSX1JFQ09VTlRfREVMQVkpOwo+IAo+IAlzcGlfc2V0X2RydmRhdGEoc3BpLCBwcml2KTsK
PiAKPi0tIAo+Mi4zNC4xCg==
